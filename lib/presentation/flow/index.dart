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
        fontSize: 28.adaptSize,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                height: 400.adaptSize,
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
                        fontSize: 65.fSize,
                        color: appTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.adaptSize),
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
                    _buildButton(),
                    SizedBox(height: 6.adaptSize),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
