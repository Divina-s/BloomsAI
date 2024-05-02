import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/controller/provider/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text('Language', style: AppTextStyles.body14),
      ),
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 4.h),
          Text(
            'Select Language',
            style: AppTextStyles.small12,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              SizedBox(
                child: Text(
                  'English',
                  style: AppTextStyles.small12,
                ),
              ),
              SizedBox(width: 63.w), // The text displ
              Expanded(
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),

                  value:
                      'English', // The value associated with the radio button
                  groupValue: context
                      .read<ProfileProvider>()
                      .selectedLanguage, // The currently selected value of the radio group
                  onChanged: (value) {
                    setState(() {
                      context.read<ProfileProvider>().selectedLanguage =
                          value.toString();
                    });
                  }, // Update the selected value
                ),
              ),
            ],
          ),
          //SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Text(
                  'French',
                  style: AppTextStyles.small12,
                ),
              ),
              SizedBox(width: 64.w), // The text displ
              Expanded(
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),

                  value: 'French', // The value associated with the radio button
                  groupValue: context
                      .read<ProfileProvider>()
                      .selectedLanguage, // The currently selected value of the radio group
                  onChanged: (value) {
                    setState(() {
                      context.read<ProfileProvider>().selectedLanguage =
                          value.toString();
                    });
                  }, // Update the selected value
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Text(
                  'Pidgen',
                  style: AppTextStyles.small12,
                ),
              ),
              SizedBox(width: 64.w), // The text displ
              Expanded(
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),

                  value: 'Pidgen', // The value associated with the radio button
                  groupValue: context
                      .read<ProfileProvider>()
                      .selectedLanguage, // The currently selected value of the radio group
                  onChanged: (value) {
                    setState(() {
                      context.read<ProfileProvider>().selectedLanguage =
                          value.toString();
                    });
                  }, // Update the selected value
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
