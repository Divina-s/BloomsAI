// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.postColor),
      child: ListTile(
        selectedColor: AppColors.postColor,
        leading: Image.asset(
          image,
          height: 7.h,
          width: 7.w,
        ),
        title: Text(title,
            style: AppTextStyles.small10),
        trailing: Icon(IconlyLight.arrow_right_2),
      ),
    );
  }
}
