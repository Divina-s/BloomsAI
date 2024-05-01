import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/custom_button.dart';
import 'package:bloomsai/app/common/widget/custome_textfield.dart';
import 'package:bloomsai/app/controller/provider/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Create Your New Password ', style: AppTextStyles.small12),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 4.h),
          Text(
            'To ensure the security of your account, please choose a strong password of at least 8 characters, mix of uppercase/lowercase letters, numbers, and symbols',
            textAlign: TextAlign.center,
            style: AppTextStyles.small10,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            hintText: 'New Password',
            prefixIcon: Icon(
              IconlyLight.lock,
            ),
          ),
          SizedBox(height: 2.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().confirmPassworController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            hintText: 'Confirm Password',
            prefixIcon: Icon(
              IconlyLight.lock,
            ),
          ),
          SizedBox(height: 45.h),
          CustomButton(
            onTap: () {},
            buttonText: 'Continue',
            status: false,
          ),
        ],
      ),
    );
  }
}
