import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Clock extends StatefulWidget {
  final double width;
  final double height;
  final String city;

  final Function(DateTime) onTimeChanged;

  const Clock({
    super.key,
    this.width = 0,
    this.height = 0,
    this.city = '',
    required this.onTimeChanged,
  });

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String date = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          padding: EdgeInsets.symmetric(
            horizontal: 2.adaptSize,
            vertical: 2.adaptSize,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          color: appTheme.primary,
                          imagePath: 'location'.icon.svg,
                        ),
                        SizedBox(width: 0.6.adaptSize),
                        Text(
                          widget.city,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: appTheme.primary,
                            fontSize: 2.5.fSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: widget.height * 0.2,
                child: AnimatedAnalogClock(
                  size: widget.width * 0.7,
                  numberColor: appTheme.black900,
                  hourHandColor: appTheme.black900,
                  hourDashColor: appTheme.black900,
                  centerDotColor: appTheme.primary,
                  minuteHandColor: appTheme.primary,
                  secondHandColor: appTheme.primary,
                  dialType: DialType.numberAndDashes,
                  backgroundColor: appTheme.white800,
                  minuteDashColor: appTheme.black900,
                  onTimeChanged: (datetime) {
                    widget.onTimeChanged(datetime);
                    setState(() {
                      date = datetime.format("EEEE, MMMM d, yyyy").toString();
                      time = datetime.format("hh:mm:ss a").toString();
                    });
                  },
                ),
              ),
              Positioned(
                bottom: widget.height * 0.02,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.5.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 0.4.adaptSize),
                    Text(
                      time,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.5.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
