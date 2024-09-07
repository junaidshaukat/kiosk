import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

class ClockDashesPainter extends CustomPainter {
  final double clockSize;
  final Color? hourDashColor;
  final DialType dialType;
  final Color? minuteDashColor;
  final Color? numberColor;

  ClockDashesPainter({
    required this.clockSize,
    this.hourDashColor,
    this.minuteDashColor,
    required this.dialType,
    this.numberColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double padding = clockSize / 20;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = clockSize / 2;
    final hourDashLength = clockSize / 15;
    final minuteDashLength = clockSize / 30;

    final hourPaint = Paint()
      ..color = hourDashColor ?? Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    final minutePaint = Paint()
      ..color = minuteDashColor ?? Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    if (dialType == DialType.numberAndDashes) {
      // Draw hour dashes that not contain [0, 3, 6, 9]
      for (int i = 0; i < 12; i++) {
        if (![0, 3, 6, 9].contains(i)) {
          final angle = 2 * pi * i / 12;
          final startX = center.dx + (radius - padding) * cos(angle);
          final startY = center.dy + (radius - padding) * sin(angle);
          final endX = center.dx + (radius - hourDashLength * 1.5) * cos(angle);
          final endY = center.dy + (radius - hourDashLength * 1.5) * sin(angle);
          canvas.drawLine(
              Offset(startX, startY), Offset(endX, endY), hourPaint);
        }
      }
    }

    if (dialType == DialType.dashes) {
      // Draw hour dashes
      for (int i = 0; i < 12; i++) {
        final angle = 2 * pi * i / 12;
        final startX = center.dx + (radius - padding) * cos(angle);
        final startY = center.dy + (radius - padding) * sin(angle);
        final endX =
            center.dx + (radius - padding - hourDashLength) * cos(angle);
        final endY =
            center.dy + (radius - padding - hourDashLength) * sin(angle);
        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), hourPaint);
      }
    }
    if (dialType == DialType.dashes) {
      // Draw minute dashes
      for (int i = 0; i < 60; i++) {
        if (i % 5 != 0) {
          final angle = 2 * pi * i / 60;
          final startX = center.dx + (radius - padding) * cos(angle);
          final startY = center.dy + (radius - padding) * sin(angle);
          final endX =
              center.dx + (radius - padding - minuteDashLength) * cos(angle);
          final endY =
              center.dy + (radius - padding - minuteDashLength) * sin(angle);
          canvas.drawLine(
              Offset(startX, startY), Offset(endX, endY), minutePaint);
        }
      }
    }

    if (dialType == DialType.numberAndDashes) {
      // Draw numbers 12, 3, 6, 9
      for (int i in [0, 3, 6, 9]) {
        final angle =
            2 * pi * (i - 3) / 12; // Adjust the angle for correct positioning
        final numberX = center.dx + (radius - hourDashLength) * cos(angle);
        final numberY = center.dy + (radius - hourDashLength) * sin(angle);
        textPainter.text = TextSpan(
          text: (i == 0 ? 12 : i).toString(),
          style: TextStyle(
            fontSize: clockSize / 16,
            color: numberColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            numberX - textPainter.width / 2,
            numberY - textPainter.height / 2,
          ),
        );
      }
    }

    // Draw numbers
    if (dialType == DialType.numbers) {
      for (int i = 1; i <= 12; i++) {
        final angle =
            2 * pi * (i - 3) / 12; // Adjust the angle for correct positioning
        final numberX =
            center.dx + (radius - hourDashLength * 1.2) * cos(angle);
        final numberY =
            center.dy + (radius - hourDashLength * 1.2) * sin(angle);
        textPainter.text = TextSpan(
          text: i.toString(),
          style: TextStyle(
            fontSize: clockSize / 16,
            color: numberColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            numberX - textPainter.width / 2,
            numberY - textPainter.height / 2,
          ),
        );
      }
    }

    if (dialType == DialType.romanNumerals) {
      const List<String> romanNumerals = [
        'XII',
        'I',
        'II',
        'III',
        'IV',
        'V',
        'VI',
        'VII',
        'VIII',
        'IX',
        'X',
        'XI'
      ];

      for (int i = 0; i < 12; i++) {
        final angle = 2 * pi * (i - 3) / 12;
        final offsetX = (clockSize / 2) + (clockSize / 2.4) * cos(angle);
        final offsetY = (clockSize / 2) + (clockSize / 2.4) * sin(angle);

        textPainter.text = TextSpan(
          text: romanNumerals[i],
          style: TextStyle(
            fontSize: clockSize / 16,
            color: numberColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            offsetX - textPainter.width / 2,
            offsetY - textPainter.height / 2,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ClockFace extends StatelessWidget {
  const ClockFace({
    super.key,
    required this.currentTime,
    required this.clockSize,
    required this.backgroundColor,
    this.backgroundGradient,
    required this.hourHandColor,
    required this.minuteHandColor,
    required this.secondHandColor,
    required this.hourDashColor,
    required this.minuteDashColor,
    required this.centerDotColor,
    required this.dialType,
    required this.showSecondHand,
    this.numberColor,
    required this.extendMinuteHand,
    required this.extendHourHand,
    required this.extendSecondHand,
  });
  final double clockSize;
  final DateTime currentTime;
  final DialType dialType;
  final Color backgroundColor;
  final Gradient? backgroundGradient;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color centerDotColor;
  final Color? hourDashColor;
  final Color? minuteDashColor;
  final Color? numberColor;
  final bool extendSecondHand;
  final bool extendMinuteHand;
  final bool extendHourHand;
  final bool showSecondHand;

  static const _secondHandMultiplier = 2 * pi / 60;
  static const _minuteHandMultiplier = 2 * pi / 60;
  static const _hourHandMultiplier = 2 * pi / 12;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: clockSize,
      height: clockSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundGradient == null ? backgroundColor : null,
        gradient:
            backgroundGradient != null && backgroundColor == Colors.transparent
                ? backgroundGradient
                : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (dialType != DialType.none)
            CustomPaint(
              size: Size(clockSize, clockSize),
              painter: ClockDashesPainter(
                clockSize: clockSize,
                dialType: dialType,
                hourDashColor: hourDashColor,
                minuteDashColor: minuteDashColor,
                numberColor: numberColor,
              ),
            ),
          minuteHandBuilder(context),
          hourHandBuilder(context),
          if (showSecondHand) secondHandBuilder(),
          Center(
            child: Container(
              width: clockSize / 20,
              height: clockSize / 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: centerDotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondHandBuilder() {
    return ClockHand(
      handColor: secondHandColor,
      length: 0.7,
      width: clockSize / 100,
      clockSize: clockSize,
      extendedTip: extendSecondHand ? 0.1 : 0,
      angle: (currentTime.second + (currentTime.millisecond / 1000)) *
          _secondHandMultiplier,
    );
  }

  Widget minuteHandBuilder(BuildContext context) {
    return ClockHand(
      handColor: minuteHandColor,
      length: 0.65,
      width: clockSize / 55,
      clockSize: clockSize,
      extendedTip: extendMinuteHand ? 0.1 : 0,
      angle: (currentTime.minute + (currentTime.second / 60)) *
          _minuteHandMultiplier,
    );
  }

  Widget hourHandBuilder(BuildContext context) {
    return ClockHand(
      handColor: hourHandColor,
      length: 0.5,
      extendedTip: extendHourHand ? 0.1 : 0,
      width: clockSize / 45,
      clockSize: clockSize,
      angle: (currentTime.hour % 12 + currentTime.minute / 60) *
          _hourHandMultiplier,
    );
  }
}

class ClockHand extends StatelessWidget {
  final Color handColor;
  final double angle;
  final double length;
  final double width;
  final double clockSize;
  final double extendedTip;

  const ClockHand({
    super.key,
    required this.handColor,
    required this.angle,
    required this.length,
    required this.width,
    required this.clockSize,
    this.extendedTip = 0,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the hand size based on the clock size
    final double size = clockSize * length;
    return Center(
      child: Transform.rotate(
        angle: angle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width,
              height: size * (0.5 + extendedTip),
              decoration: BoxDecoration(
                color: handColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            // This SizedBox is for the center dot of the clock, ensure the center alignment
            SizedBox(
              width: 2,
              height: size * (0.5 - extendedTip),
            ),
          ],
        ),
      ),
    );
  }
}

/// An enumeration to define the types of dials that can be displayed on a clock.
enum DialType {
  /// Displays only dashes on the clock face.
  dashes,

  /// Displays only numbers on the clock face.
  numbers,

  /// Displays both dashes and numbers at 12, 3, 6, and 9 positions on the clock face.
  numberAndDashes,

  /// Displays only roman numerals on the clock face.
  romanNumerals,

  /// Displays no dials on the clock face.
  none,
}

class AnimatedAnalogClock extends StatefulWidget {
  /// If this property is null then [AnalogClockState.size] value is [MediaQuery.of(context).size.height * 0.3].
  final double? size;

  /// If null, current location use for the timezone [DateTime.now()]
  ///
  /// Check out the timezone names from [this link](https://help.syncfusion.com/flutter/calendar/timezone).
  final String? location;

  /// change background color of clock face
  ///
  /// If null, [Colors.transparent] is use
  final Color backgroundColor;

  /// To add Gradient color in clock face background
  final Gradient? backgroundGradient;

  /// Property to change hour hand color
  ///
  /// If null, [Theme.of(context).colorScheme.primary] color is used
  final Color? hourHandColor;

  /// Property to change minute hand color
  ///
  /// If null, [Theme.of(context).colorScheme.primary] color is used
  final Color? minuteHandColor;

  /// Property to change second hand color
  ///
  /// If null, [Color(0xFFfa1e1e)] color is used
  final Color secondHandColor;

  /// Property to change dial hour dash color
  ///
  /// If null, [Colors.black] color is used
  final Color? hourDashColor;

  /// If null, [Colors.grey] color is used
  final Color? minuteDashColor;

  /// change the color of the center dot of clock face default color [Color(0xFFfa1e1e)]
  final Color? centerDotColor;

  /// Property to change dial number style
  ///
  /// If null, [DialType.dashes] is used
  final DialType dialType;

  /// Property to show or hide the seconds hand
  ///
  /// If null, [true] is used
  final bool showSecondHand;

  /// Property to change dial number color
  ///
  /// If null, [Colors.white] color is used
  final Color? numberColor;

  /// Property to show or hide the seconds hand
  ///
  /// If null, [false] is used
  final bool? extendSecondHand;

  /// Property to extend second hand
  ///
  /// If null, [false] is used
  final bool? extendMinuteHand;

  /// Property to extend hour hand
  ///
  /// If null, [false] is used
  final bool? extendHourHand;

  /// Property to specify the duration for updating the time
  final Duration? updateInterval;

  /// Callback function to get the current time.
  final Function(DateTime)? onTimeChanged;

  /// Animated Analog Clock Widget
  const AnimatedAnalogClock({
    super.key,
    this.size,
    this.backgroundColor = Colors.transparent,
    this.backgroundGradient,
    this.hourHandColor,
    this.minuteHandColor,
    this.secondHandColor = const Color(0xFFfa1e1e),
    this.hourDashColor,
    this.minuteDashColor,
    this.centerDotColor,
    this.location,
    this.dialType = DialType.dashes,
    this.showSecondHand = true,
    this.numberColor,
    this.extendMinuteHand,
    this.extendHourHand,
    this.extendSecondHand,
    this.updateInterval,
    this.onTimeChanged,
  });

  @override
  State<AnimatedAnalogClock> createState() => _AnimatedAnalogClockState();
}

class _AnimatedAnalogClockState extends State<AnimatedAnalogClock> {
  Timer? timer;
  late ValueNotifier<DateTime> currentTime;

  /// getter for getting specified location timezone
  DateTime get locationTime {
    if (widget.location != null) {
      var detroit = getLocation(widget.location!);
      var now = TZDateTime.now(detroit);
      return now;
    } else {
      return DateTime.now();
    }
  }

  /// update the clock time in every 10 milliseconds
  void startClockTime() {
    timer = Timer.periodic(
      widget.updateInterval ??
          (widget.showSecondHand
              ? const Duration(milliseconds: 16)
              : const Duration(seconds: 2)),
      (timer) {
        final newTime = locationTime;
        currentTime.value = newTime;
        if (widget.onTimeChanged != null) {
          widget.onTimeChanged!(newTime);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initializeTimeZones();
    currentTime = ValueNotifier(locationTime);
    startClockTime();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentTime,
      builder: (context, value, child) => ClockFace(
        clockSize: widget.size ?? MediaQuery.of(context).size.height * 0.3,
        currentTime: currentTime.value,
        hourHandColor:
            widget.hourHandColor ?? Theme.of(context).colorScheme.primary,
        minuteHandColor:
            widget.minuteHandColor ?? Theme.of(context).colorScheme.primary,
        secondHandColor: widget.secondHandColor,
        centerDotColor:
            widget.centerDotColor ?? Theme.of(context).colorScheme.primary,
        hourDashColor: widget.hourDashColor,
        minuteDashColor: widget.minuteDashColor,
        backgroundColor: widget.backgroundColor,
        backgroundGradient: widget.backgroundGradient,
        dialType: widget.dialType,
        showSecondHand: widget.showSecondHand,
        numberColor: widget.numberColor,
        extendSecondHand: widget.extendSecondHand ?? true,
        extendMinuteHand: widget.extendMinuteHand ?? false,
        extendHourHand: widget.extendHourHand ?? false,
      ),
    );
  }
}
