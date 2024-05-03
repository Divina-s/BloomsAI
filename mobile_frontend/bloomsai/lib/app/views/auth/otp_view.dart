import 'dart:async';

import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/others/custom_button.dart';
import 'package:bloomsai/app/controller/provider/auth/auth_provider.dart';
import 'package:bloomsai/app/views/auth/new_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  int num = 60;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  decreaseNum() {
    if (num > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          num = num - 1;
        });
        decreaseNum();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      decreaseNum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Enter Verification Code', style: AppTextStyles.small12),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 2.h),
          Text(
            'A 5-digit code has been sent to your email. Please enter it below to verify your identity.',
            textAlign: TextAlign.center,
            style: AppTextStyles.small10,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: PinCodeTextField(
              appContext: context,
              length: 5,
              obscureText: false,
              animationType: AnimationType.fade,
              textStyle: AppTextStyles.body14,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.sp),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: AppColors.whiteColor,
                  inactiveColor: AppColors.greyShade3,
                  inactiveFillColor: AppColors.greyShade3,
                  selectedFillColor: AppColors.whiteColor,
                  selectedColor: AppColors.black,
                  activeColor: AppColors.black),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: context.read<AuthProvider>().otpController,
              onCompleted: (value) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            num.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.small10
                .copyWith(color: num > 1 ? AppColors.red : AppColors.red),
          ),
          Text(
            "Resend!",
            textAlign: TextAlign.center,
            style: AppTextStyles.small10,
          ),
          SizedBox(height: 45.h),
          CustomButton(
            onTap: () {
              Get.to(() => const NewPassword(),
                  duration: Duration(milliseconds: 800),
                  transition: Transition.fadeIn);
            },
            buttonText: 'Continue',
            status: false,
          ),
        ],
      ),
    );
  }
}
