import 'package:flutter/material.dart';
import '/core/app_export.dart';

enum KeyboardEvent { clear, pop, fixed, number, ok, dot }

class Keyboard extends StatelessWidget {
  final Size size;
  final double? gap;
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
    this.gap = 16,
    this.radius = 04,
    this.spacing = 16,
    this.hintFontSize,
    this.amount = '00',
    this.labelFontSize,
    this.amountFontSize,
    this.runSpacing = 16,
    required this.onPressed,
    this.size = const Size(100, 60),
    this.constraints = const BoxConstraints(maxWidth: 550),
  });

  Widget box({
    String? icon,
    num value = 0,
    double? height,
    double width = 0,
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
                  width: width * 0.5,
                  height: width * 0.5,
                  fit: BoxFit.contain,
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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: gap),
        ConstrainedBox(
          constraints: constraints,
          child: Container(
            padding: padding,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: appTheme.gray100,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Text(
              amount,
              textAlign: TextAlign.center,
              style: TextStyles.headlineSmall.copyWith(
                fontSize: amountFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: gap),
        ConstrainedBox(
          constraints: constraints,
          child: Row(
            children: [
              Column(
                children: [
                  box(
                    label: '\$5',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '5');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$10',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '10');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$20',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '20');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$30',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '30');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 6),
              Column(
                children: [
                  box(
                    label: '1',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('1'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '4',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('4'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '7',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('7'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '00',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('00'));
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Column(
                children: [
                  box(
                    label: '2',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('2'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '5',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('5'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '8',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('8'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '0',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('0'));
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Column(
                children: [
                  box(
                    label: '3',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('3'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '6',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('6'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '9',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.number, amount.concat('9'));
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '.',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.dot, '.');
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Column(
                children: [
                  box(
                    width: size.width * 0.70,
                    height: size.height,
                    icon: 'clear'.icon.svg,
                    onTap: () {
                      onPressed(KeyboardEvent.clear, '0');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: 'C',
                    width: size.width * 0.70,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.pop, amount);
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: 'lbl_ok'.tr,
                    width: size.width * 0.70,
                    height: (size.height * 2) + runSpacing,
                    onTap: () {
                      onPressed(KeyboardEvent.ok, amount);
                    },
                  ),
                ],
              ),
              const Spacer(flex: 6),
              Column(
                children: [
                  box(
                    label: '\$40',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '40');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$50',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '50');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$60',
                    width: size.width,
                    height: size.height,
                    onTap: () {
                      onPressed(KeyboardEvent.fixed, '60');
                    },
                  ),
                  SizedBox(height: runSpacing),
                  box(
                    label: '\$100',
                    width: size.width,
                    height: size.height,
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
