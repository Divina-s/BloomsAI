import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/custom_button.dart';
import 'package:bloomsai/app/views/onboard/onboard_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
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
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SvgPicture.asset(ImageAssets.logo, width: 50.w),
          SizedBox(height: 2.h),
          Image.asset(
            ImageAssets.onboard,
            width: 20.w,
          ),
          SizedBox(height: 1.h),
          Text(
            'See the Future of Farming',
            textAlign: TextAlign.center,
            style: AppTextStyles.body14Bold,
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text(
              'Don\'t let crop disease steal your harvest. Leverage the power of AI to identify crop diseases early, before they can devastate your yield.',
              textAlign: TextAlign.center,
              style: AppTextStyles.small10,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Language",
                textAlign: TextAlign.center,
                style: AppTextStyles.small12Bold,
              ),
              SizedBox(width: 2.w),
              CircleAvatar(
                foregroundColor: AppColors.primaryColor,
                child: Text(
                  'ENG',
                  style: AppTextStyles.small10
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          SizedBox(height: 8.h),
          CustomButton(
            onTap: () {
              Get.to(() => const OnboardOne(),
                  duration: Duration(milliseconds: 800),
                  transition: Transition.fadeIn);
            },
            buttonText: "Get Started",
            status: false,
          ),
        ],
      ),
    );
  }
}
