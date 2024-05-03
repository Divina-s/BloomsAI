import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/utils/navigator.dart';

import 'package:bloomsai/app/common/widget/others/custom_button.dart';
import 'package:bloomsai/app/common/widget/others/upload_card.dart';

import 'package:bloomsai/app/controller/provider/diagnose/diagnose_provider.dart';
import 'package:bloomsai/app/views/diagnose/result_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DiagnoseView extends StatefulWidget {
  const DiagnoseView({Key? key}) : super(key: key);

  @override
  _DiagnoseViewState createState() => _DiagnoseViewState();
}

class _DiagnoseViewState extends State<DiagnoseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text('Upload Plant Image', style: AppTextStyles.body14),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 4.h),
          context.read<DiagnoseProvider>().selectedImage != null
              ? SelectedImageView(
                  selectedImage: context.read<DiagnoseProvider>().selectedImage,
                  onTap: context.read<DiagnoseProvider>().pickImage,
                )
              : ImageUploadView(
                  onTap: context.read<DiagnoseProvider>().pickImage),
          SizedBox(height: 10.h),
          CustomButton(
            status: false,
            onTap: () {
              PageNavigator(ctx: context).nextPage(
                  page: ResultView(
                      selectedImage:
                          context.read<DiagnoseProvider>().selectedImage));
            },
            buttonText: "Diagnose Plant",
          )
        ],
      ),
    );
  }
}
