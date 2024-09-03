import 'package:flutter/material.dart';
import '/core/app_export.dart';

class FlowScreen extends StatefulWidget {
  const FlowScreen({super.key});

  @override
  State<FlowScreen> createState() => FlowScreenState();
}

class FlowScreenState extends State<FlowScreen> {
  int groupValue = 1;

  late PreferenceProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Widget clipPath({double? height, double? fontSize}) {
    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        height: height,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: appTheme.green900,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('stars'.image.png),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "lbl_log_in".tr,
              style: TextStyles.displayLarge.copyWith(
                fontSize: fontSize,
                color: appTheme.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String label,
    required int value,
    int? groupValue,
    void Function(int?)? onChanged,
  }) {
    return RadioListTile<int>(
      value: value,
      title: Text(label),
      onChanged: onChanged,
      groupValue: groupValue,
    );
  }

  Widget _buildButton({
    double? width,
    double? height,
    double? fontSize,
  }) {
    return CustomElevatedButton(
      width: width,
      height: height,
      name: "lbl_continue".tr,
      textStyle: TextStyles.displayMedium.copyWith(
        fontSize: fontSize,
      ),
      onPressed: () async {
        await provider.put('flow', groupValue);
        if (groupValue == 3) {
          NavigatorService.pushNamed(AppRoutes.signin);
        } else {
          NavigatorService.pushNamed(AppRoutes.home);
        }
      },
    );
  }

  Widget expanded({
    double? width,
    double? height,
    double? fontSize,
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.adaptSize),
        child: Column(
          children: [
            _buildOption(
              value: 1,
              label: "Flow 1".tr,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 6.adaptSize),
            _buildOption(
              value: 2,
              label: "Flow 2".tr,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 6.adaptSize),
            _buildOption(
              value: 3,
              label: "Flow 3".tr,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 6.adaptSize),
            _buildButton(width: width, height: height, fontSize: fontSize),
          ],
        ),
      ),
    );
  }

  Widget responsive() {
    return Responsive(
      phone: (orientation) {
        return Column(
          children: [
            clipPath(
              fontSize: 34.fSize,
              height: 350.adaptSize,
            ),
            expanded(
              fontSize: 18.fSize,
              width: 300.adaptSize,
              height: 48.adaptSize,
            ),
          ],
        );
      },
      tablet: (orientation) {
        return Column(
          children: [
            clipPath(
              fontSize: 42.fSize,
              height: 400.adaptSize,
            ),
            expanded(
              fontSize: 24.fSize,
              width: 500.adaptSize,
              height: 60.adaptSize,
            ),
          ],
        );
      },
      kiosk: (orientation) {
        return Column(
          children: [
            clipPath(
              fontSize: 50.fSize,
              height: 500.adaptSize,
            ),
            expanded(
              fontSize: 34.fSize,
              width: 600.adaptSize,
              height: 100.adaptSize,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: responsive(),
      ),
    );
  }
}
