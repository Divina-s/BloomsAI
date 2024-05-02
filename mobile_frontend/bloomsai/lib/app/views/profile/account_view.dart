import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/utils/navigator.dart';
import 'package:bloomsai/app/common/widget/custom_button.dart';
import 'package:bloomsai/app/common/widget/custome_textfield.dart';
import 'package:bloomsai/app/common/widget/profile_card.dart';
import 'package:bloomsai/app/controller/provider/profile/profile_provider.dart';
import 'package:bloomsai/app/views/profile/language_view.dart';
import 'package:bloomsai/app/views/profile/update_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text('My Profile', style: AppTextStyles.body14),
      ),
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 5.h),
          Image.asset(
            ImageAssets.profile,
            height: 20.h,
          ),
          SizedBox(height: 0.5.h),
          Text('John Buh',
              textAlign: TextAlign.center, style: AppTextStyles.body14Bold),
          Text(
            'johnbull@gmail.com',
            textAlign: TextAlign.center,
            style: AppTextStyles.small12,
          ),
          Divider(color: AppColors.grey),
          SizedBox(height: 3.h),
          ProfileCard(
            onTap: () {
              PageNavigator(ctx: context).nextPage(page: const UpdateView());
            },
            icon: ImageAssets.account,
            title: 'Account',
          ),
          ProfileCard(
            onTap: () {
              PageNavigator(ctx: context).nextPage(page: const LanguageView());
            },
            icon: ImageAssets.language,
            title: 'Language',
          ),
          ProfileCard(
            onTap: () => showModalBottomSheet<void>(
              context: context,
              // showDragHandle: true,
              backgroundColor: AppColors.whiteColor,
              builder: (BuildContext context) {
                return Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.sp),
                            topRight: Radius.circular(20.sp))),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Text('Rate Us!!',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.body14Bold),
                        Text(
                          'Give  us a star ranging from 1-5 for this app',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.small12.copyWith(height: 2.sp),
                        ),
                        SizedBox(height: 5.h),
                        SvgPicture.asset(ImageAssets.rate_us),
                        SizedBox(height: 5.h),
                        Text(
                          'Any Feedback for improvement? (optional)',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.small12.copyWith(height: 2.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: CustomTextField(
                            padding: 16.sp,
                            controller: context
                                .read<ProfileProvider>()
                                .feedbackController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            hintText: 'Enter Feedback',
                            // prefixIcon: Icon(
                            //   IconlyLight.call,
                            // ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          width: 90.w,
                          child: CustomButton(
                            status: false,
                            onTap: () {},
                            buttonText: "Submit",
                          ),
                        )
                      ],
                    ));
              },
            ),
            icon: ImageAssets.rate,
            title: 'Rate us',
          ),
          ProfileCard(
            onTap: () {},
            icon: ImageAssets.privacy,
            title: 'Privacy Policy',
          ),
          ProfileCard(
            onTap: () {},
            icon: ImageAssets.logout,
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}
