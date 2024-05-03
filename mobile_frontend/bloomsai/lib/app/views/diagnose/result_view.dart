import 'dart:io';

import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/others/upload_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key, required this.selectedImage}) : super(key: key);
  final File? selectedImage;
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text('Result', style: AppTextStyles.body14),
        actions: [
          Icon(IconlyLight.download),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 3.h),
          ImageView(
            selectedImage: widget.selectedImage,
          ),
          SizedBox(height: 1.h),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
            visualDensity: VisualDensity(horizontal: -4),
            title: Text('We’re confident that this is:',
                style: AppTextStyles.small10),
            subtitle:
                Text('Botrytis (Gray Mold)', style: AppTextStyles.small12Bold),
            trailing: SvgPicture.asset(ImageAssets.audio),
          ),
          SizedBox(height: 2.h),
          Text('Summary', style: AppTextStyles.body14),
          SizedBox(height: 1.h),
          Text(
              'Botrytis, or Gray Mold, is a fungal disease caused by Botrytis cinerea that attacks all parts of a tomato plant, from leaves and stems to flowers and fruits. It thrives in cool, humid environments and manifests as grayish fuzzy mold, causing watery spots on fruits that turn brown and mushy, ultimately reducing crop yield and marketability of your tomatoes.',
              style: AppTextStyles.small10),
          SizedBox(height: 1.h),
          Text('Recommendation', style: AppTextStyles.body14),
          SizedBox(height: 1.h),
          Text(
              'Always avoid overhead irrigation with tomatoes. If you live in a moist climate, create more air circulation by increasing the spacing and pruning of your plants.',
              style: AppTextStyles.small10),
        ],
      ),
    );
  }
}
