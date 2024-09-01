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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () async {
        await provider.put('flow', groupValue);
        if (groupValue == 3) {
          NavigatorService.pushNamed(AppRoutes.signin);
        } else {
          NavigatorService.pushNamed(AppRoutes.home);
        }
      });
    });
  }

  Widget get clipPath {
    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        height: 350.v,
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
                fontSize: 50.fSize,
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

  Widget _buildButton() {
    return CustomElevatedButton(
      width: 500.adaptSize,
      height: 58.adaptSize,
      name: "lbl_continue".tr,
      textStyle: TextStyles.displayMedium.copyWith(
        fontSize: 28.fSize,
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

  Widget get expanded {
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
            SizedBox(height: 6.v),
            _buildOption(
              value: 2,
              label: "Flow 2".tr,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 6.v),
            _buildOption(
              value: 3,
              label: "Flow 3".tr,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 6.v),
            _buildButton(),
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
            clipPath,
            expanded,
          ],
        );
      },
      tablet: (orientation) {
        return Column(
          children: [
            clipPath,
            expanded,
          ],
        );
      },
      kiosk: (orientation) {
        return Column(
          children: [
            clipPath,
            expanded,
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
