import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/custom_button.dart';
import 'package:bloomsai/app/common/widget/custome_textfield.dart';
import 'package:bloomsai/app/common/widget/divider.dart';
import 'package:bloomsai/app/controller/provider/auth/auth_provider.dart';
import 'package:bloomsai/app/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        children: [
          SvgPicture.asset(ImageAssets.logo),
          SizedBox(height: 1.h),
          Center(child: Text("Sign Up", style: AppTextStyles.body14Bold)),
          SizedBox(height: 1.h),
          Center(
            child: Text(
              "We are here to help you!",
              style: AppTextStyles.small12.copyWith(color: AppColors.grey),
            ),
          ),
          SizedBox(height: 3.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().fullNameController,
            keyboardType: TextInputType.name,
            obscureText: false,
            hintText: 'Your Name',
            prefixIcon: Icon(
              IconlyLight.profile,
            ),
          ),
          SizedBox(height: 2.h),
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
          SizedBox(height: 2.h),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<AuthProvider>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            hintText: 'Your Password',
            prefixIcon: Icon(
              IconlyLight.lock,
            ),
          ),
          SizedBox(height: 2.h),
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
          SizedBox(height: 4.h),
          CustomButton(
            onTap: () {},
            buttonText: 'Sign Up',
            status: false,
          ),
          SizedBox(height: 5.h),
          OrDivider(),
          SizedBox(height: 3.h),
          SvgPicture.asset(
            ImageAssets.google,
            width: 8.w,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an Account?',
                style: AppTextStyles.small10,
              ),
              SizedBox(width: 1.w),
              InkWell(
                onTap: () {
                  Get.to(() => const LoginView(),
                      duration: Duration(milliseconds: 800),
                      transition: Transition.fadeIn);
                },
                child: Text(
                  'Sign In',
                  style: AppTextStyles.small10Bold
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
