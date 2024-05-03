// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CropCard extends StatelessWidget {
  const CropCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 10.h,
          width: 10.h,
        ),
        Text(
          title,
          style: AppTextStyles.small8Bold.copyWith(height: 1.5.sp),
        )
      ],
    );
  }
}
