import 'package:flutter/material.dart';
import '/core/app_export.dart';

enum KeyboardEvent { clear, fixed, number, delete, ok, dot }

class Keyboard extends StatelessWidget {
  final Size size1;
  final Size size2;
  final Size size3;
  final String amount;
  final double radius;
  final double spacing;
  final double runSpacing;
  final double? hintFontSize;
  final double? labelFontSize;
  final double? amountFontSize;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry? padding;
  final void Function(KeyboardEvent, String) onPressed;

  const Keyboard({
    super.key,
    this.padding,
    this.radius = 16,
    this.spacing = 16,
    this.hintFontSize,
    this.amount = '00',
    this.labelFontSize,
    this.amountFontSize,
    this.runSpacing = 16,
    required this.onPressed,
    this.size1 = const Size(100, 60),
    this.size2 = const Size(100, 60),
    this.size3 = const Size(100, 60),
    this.constraints = const BoxConstraints(maxWidth: 550),
  });

  Widget box({
    String? icon,
    double? width,
    num value = 0,
    double? height,
    String label = '',
    void Function()? onTap,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: appTheme.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: appTheme.primary,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: icon == null
              ? Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyles.headlineSmall.copyWith(
                    color: appTheme.white,
                    fontSize: hintFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : CustomImageView(
                  imagePath: icon,
                  color: appTheme.white,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: constraints,
          child: Container(
            color: appTheme.white,
            child: Text(
              "lbl_enter_your_own_amount".tr,
              textAlign: TextAlign.center,
              style: TextStyles.headlineSmall.copyWith(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.adaptSize),
        ConstrainedBox(
          constraints: constraints,
          child: Container(
            padding: padding,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: appTheme.gray100,
              borderRadius: BorderRadius.circular(4.adaptSize),
            ),
            child: Text(
              amount,
              textAlign: TextAlign.left,
              style: TextStyles.headlineSmall.copyWith(
                fontSize: amountFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.adaptSize),
        ConstrainedBox(
          constraints: constraints,
          child: Row(
            children: [
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    label: '\$5',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '5');
                    },
                  ),
                  box(
                    label: '\$10',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '10');
                    },
                  ),
                  box(
                    label: '\$20',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '20');
                    },
                  ),
                  box(
                    label: '\$30',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '30');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 6),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    label: '1',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '1');
                    },
                  ),
                  box(
                    label: '4',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '4');
                    },
                  ),
                  box(
                    label: '7',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '7');
                    },
                  ),
                  box(
                    label: '00',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '00');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    label: '2',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '2');
                    },
                  ),
                  box(
                    label: '5',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '5');
                    },
                  ),
                  box(
                    label: '8',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '8');
                    },
                  ),
                  box(
                    label: '0',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '0');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    label: '3',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '3');
                    },
                  ),
                  box(
                    label: '6',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '6');
                    },
                  ),
                  box(
                    label: '9',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, '9');
                    },
                  ),
                  box(
                    label: '.',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.dot, '.');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    width: size2.width,
                    height: size2.height,
                    icon: 'clear'.icon.svg,
                    onTap: () {
                      onPressed(KeyboardEvent.clear, 'clear');
                    },
                  ),
                  box(
                    label: 'C',
                    width: size2.width,
                    height: size2.height,
                    onTap: () {
                      onPressed(KeyboardEvent.delete, 'C');
                    },
                  ),
                  box(
                    label: 'lbl_ok'.tr,
                    width: size3.width,
                    height: size3.height,
                    onTap: () {
                      onPressed(KeyboardEvent.ok, 'ok');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 6),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                direction: Axis.vertical,
                children: [
                  box(
                    label: '\$40',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '40');
                    },
                  ),
                  box(
                    label: '\$50',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '50');
                    },
                  ),
                  box(
                    label: '\$60',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '60');
                    },
                  ),
                  box(
                    label: '\$100',
                    width: size1.width,
                    height: size1.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '100');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
