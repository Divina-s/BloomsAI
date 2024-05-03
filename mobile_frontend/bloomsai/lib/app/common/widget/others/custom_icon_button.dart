import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key,
      required this.onTap,
      required this.borderColor,
      required this.icon,
      required this.bgColor,
      this.iconColor,
      this.textColor,
      required this.buttonText})
      : super(key: key);

  final Function() onTap;
  final Color borderColor;
  final String icon;
  final Color bgColor;
  final String buttonText;
  Color? iconColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: iconColor,
              width: 6.w,
            ),
            SizedBox(width: 1.5.w),
            Text(
              buttonText,
              style: AppTextStyles.small12.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
