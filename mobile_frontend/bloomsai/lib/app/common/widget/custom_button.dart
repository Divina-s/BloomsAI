// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.status,
  }) : super(key: key);
  final Function() onTap;
  final String buttonText;
  bool? status;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: status == false
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 1.3.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style:
                    AppTextStyles.small12.copyWith(color: AppColors.whiteColor),
              ),
            )
          : Center(child: SpinKitFadingCircle(color: AppColors.primaryColor)),
    );
  }
}
