import 'dart:io';

import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageUploadView extends StatelessWidget {
  const ImageUploadView({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 30.h,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF949494)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Image.asset(
                ImageAssets.uploadIcon,
                width: 30,
                height: 30,
              ),
            ),
            Text('Upload Image', style: AppTextStyles.body16Bold),
            Text('.png, .jpg, ',
                style: AppTextStyles.small12.copyWith(
                    color: AppColors.greyShade3, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}

class SelectedImageView extends StatelessWidget {
  const SelectedImageView({super.key, this.selectedImage, this.onTap});

  final File? selectedImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 30.h,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: FileImage(selectedImage!),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  height: 5.h,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Change photo',
                          style: AppTextStyles.small10
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.selectedImage});

  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.h,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: FileImage(selectedImage!),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
