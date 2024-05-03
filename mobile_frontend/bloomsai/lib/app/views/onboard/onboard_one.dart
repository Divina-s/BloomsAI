import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';

import 'package:bloomsai/app/common/widget/others/custom_icon_button.dart';
import 'package:bloomsai/app/views/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OnboardOne extends StatelessWidget {
  const OnboardOne({Key? key}) : super(key: key);

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
        padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
        children: [
          SizedBox(height: 5.h),
          SvgPicture.asset(ImageAssets.logo),
          SizedBox(height: 20.h),
          CustomIconButton(
            onTap: () {
              Get.to(() => const RegisterView(),
                  duration: Duration(milliseconds: 800),
                  transition: Transition.fadeIn);
            },
            icon: ImageAssets.email,
            buttonText: "Sign Up with Email",
            bgColor: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            iconColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          SizedBox(height: 5.h),
          CustomIconButton(
            onTap: () {},
            icon: ImageAssets.google,
            buttonText: "Sign Up with Google",
            bgColor: AppColors.whiteColor,
            borderColor: AppColors.primaryColor,
            textColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
