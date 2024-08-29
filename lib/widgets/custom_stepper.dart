import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Steps {
  final Color left;
  final Color right;
  final Color text;
  final Color circle;
  final String label;

  Steps({
    this.label = '',
    this.left = const Color(0XFFE8E6EA),
    this.text = const Color(0XFF79797A),
    this.right = const Color(0XFFE8E6EA),
    this.circle = const Color(0XFFE8E6EA),
  });

  static List<Steps> steps(int s) {
    List<Steps> step = [];
    if (s == 0) {
      step.addAll([
        Steps(
          label: 'Campaign',
          left: Colors.transparent,
          text: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Amount',
        ),
        Steps(
          label: 'Payment',
        ),
        Steps(
          label: 'Review',
          right: Colors.transparent,
        ),
      ]);
    } else if (s == 1) {
      step.addAll([
        Steps(
          label: 'Campaign',
          left: Colors.transparent,
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Amount',
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Payment',
        ),
        Steps(
          label: 'Review',
          right: Colors.transparent,
        ),
      ]);
    } else if (s == 2) {
      step.addAll([
        Steps(
          label: 'Campaign',
          left: Colors.transparent,
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Amount',
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Payment',
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Review',
          right: Colors.transparent,
        ),
      ]);
    } else if (s == 3) {
      step.addAll([
        Steps(
          label: 'Campaign',
          left: Colors.transparent,
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Amount',
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Payment',
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          right: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
        Steps(
          label: 'Review',
          right: Colors.transparent,
          left: const Color(0XFF007C16),
          text: const Color(0XFF007C16),
          circle: const Color(0XFF007C16),
        ),
      ]);
    }
    return step;
  }
}

class CustomStepper extends StatelessWidget {
  final int step;
  const CustomStepper({super.key, this.step = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.v,
      ),
      child: SizedBox(
        height: 60.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Steps.steps(step).map((s) => _buildStep(s)).toList(),
        ),
      ),
    );
  }

  Widget _buildStep(Steps s) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              width: 20.h,
              height: 6.v,
              decoration: BoxDecoration(
                color: s.left,
              ),
            ),
            Container(
              width: 24.adaptSize,
              height: 24.adaptSize,
              decoration: BoxDecoration(
                color: s.circle,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.adaptSize,
                  color: appTheme.white,
                ),
              ),
            ),
            Container(
              width: 20.h,
              height: 6.v,
              decoration: BoxDecoration(
                color: s.right,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.v),
        Text(
          s.label,
          style: TextStyle(
            color: s.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
