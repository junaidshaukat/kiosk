import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Donation extends StatelessWidget {
  final double width;
  final double height;
  final String project;
  final double progress;
  final String raisedAmount;
  final String targetedAmount;
  final String remainingAmount;

  const Donation({
    super.key,
    this.width = 0,
    this.height = 0,
    this.project = '',
    this.progress = 0,
    this.raisedAmount = '\$0',
    this.targetedAmount = '\$0',
    this.remainingAmount = '\$0',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${"Targeted Amount".tr}: $targetedAmount',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.0.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${"Raised Amount".tr}: $raisedAmount',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.0.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${"Remaining Amount".tr}: $remainingAmount',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.0.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      project,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 2.5.fSize,
                        color: appTheme.blue53,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    Container(
                      width: width * 0.6,
                      height: width * 0.6,
                      color: appTheme.white,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            endAngle: 270,
                            startAngle: 270,
                            showTicks: false,
                            showLabels: false,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.15,
                              color: appTheme.gray200,
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            annotations: [
                              GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.15,
                                widget: Text(
                                  '${progress.toStringAsFixed(0)}%',
                                  style: TextStyles.displayMedium.copyWith(
                                    fontSize: 6.0.fSize,
                                    color: appTheme.blue53,
                                  ),
                                ),
                              ),
                            ],
                            pointers: <GaugePointer>[
                              RangePointer(
                                width: 0.15,
                                value: progress,
                                color: appTheme.primary,
                                sizeUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.startCurve,
                              ),
                              MarkerPointer(
                                value: progress,
                                color: appTheme.green22,
                                markerWidth: 6.adaptSize,
                                borderWidth: 1.adaptSize,
                                markerHeight: 6.adaptSize,
                                borderColor: appTheme.primary,
                                markerType: MarkerType.circle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: height * 0.02,
                child: Column(
                  children: [
                    Text(
                      'Release Amount'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 3.0.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Remaining Amount'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 3.0.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    )
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
