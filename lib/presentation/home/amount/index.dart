import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({super.key});

  @override
  State<AmountScreen> createState() => AmountScreenState();
}

class AmountScreenState extends State<AmountScreen> {
  late PreferenceProvider provider;

  int initialPage = 0;

  TextEditingController amountController = TextEditingController();

  final PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );

  int flow = 1;

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      flow = provider.flow;
    });
  }

  Widget _buildInput({
    required String hintText,
    required TextEditingController controller,
    required TextInputAction textInputAction,
  }) {
    return Input(
      hintText: hintText,
      controller: controller,
      fillColor: appTheme.gray100,
      textInputAction: textInputAction,
    );
  }

  Widget button({
    num width = 10,
    num height = 10,
    String label = '',
  }) {
    return Container(
      width: width.h,
      height: height.v,
      color: appTheme.primary,
      child: Center(
        child: Text(
          label.tr,
          style: TextStyles.labelMedium,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomStepper(step: 1),
            CustomDivider(height: 2.v),
            SizedBox(height: 12.v),
            CustomHeader(
              onCancel: () {
                NavigatorService.goBack();
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: "mosque@2".image.png,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_enter_your_own_amount".tr,
                            style: TextStyles.headlineSmall.copyWith(),
                          ),
                          SizedBox(height: 2.v),
                          _buildInput(
                            controller: amountController,
                            hintText: "msg_enter_your_own_amount".tr,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(height: 6.v),
                          Row(
                            children: [
                              Column(
                                children: [
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '\$5',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '\$10',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '\$20',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '\$30',
                                  ),
                                ],
                              ),
                              SizedBox(width: 20.h),
                              Column(
                                children: [
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '1',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '4',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.h),
                              Column(
                                children: [
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '1',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '4',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.h),
                              Column(
                                children: [
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '1',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '4',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.h),
                              Column(
                                children: [
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '1',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '4',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                  button(
                                    width: 20.h,
                                    height: 20.v,
                                    label: '7',
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomDivider(
              height: 2.v,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              back: true,
              lblBack: "lbl_back",
              lblNext: "lbl_confirm",
              onBack: () {
                NavigatorService.goBack();
              },
              onNext: () {
                NavigatorService.push(context, const PaymentScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
