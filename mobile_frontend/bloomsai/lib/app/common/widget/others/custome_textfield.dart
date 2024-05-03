// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.obscureText,
      required this.hintText,
      this.padding,
      this.bColor,
      this.onChange,
      this.focusNode,
      this.prefixIcon})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  double? padding;
  Color? bColor;
  Function(String)? onChange;
  Widget? prefixIcon;
  FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onChanged: onChange,
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.textFieldTextStyle,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.w),
        hintText: hintText,
        hintStyle:
            AppTextStyles.textFieldHintTextStyle.copyWith(fontSize: 10.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.sp),
          borderSide: BorderSide(color: bColor ?? AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.sp),
          borderSide: BorderSide(color: bColor ?? AppColors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.sp),
          borderSide: BorderSide(color: bColor ?? AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.sp),
          borderSide: BorderSide(color: bColor ?? AppColors.grey),
        ),
      ),
    );
  }
}
