import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/others/custom_button.dart';
import 'package:bloomsai/app/common/widget/others/custome_textfield.dart';
import 'package:bloomsai/app/common/widget/others/divider.dart';
import 'package:bloomsai/app/controller/provider/auth/auth_provider.dart';
import 'package:bloomsai/app/views/auth/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Forgot Password', style: AppTextStyles.small12),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 2.h),
          Text(
            'No worries, we can help you get back in. Enter your registered email address and reset your password.',
            textAlign: TextAlign.center,
            style: AppTextStyles.small10,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().emailController,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            hintText: 'Your Email',
            prefixIcon: Icon(
              IconlyLight.message,
            ),
          ),
          SizedBox(height: 3.h),
          OrDivider(),
          SizedBox(height: 3.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().phoneController,
            keyboardType: TextInputType.phone,
            obscureText: false,
            hintText: 'Your Phone',
            prefixIcon: Icon(
              IconlyLight.call,
            ),
          ),
          SizedBox(height: 43.h),
          CustomButton(
            onTap: () {
              Get.to(() => const OtpView(),
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
