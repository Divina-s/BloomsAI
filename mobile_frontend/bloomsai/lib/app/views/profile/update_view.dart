import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/others/custom_button.dart';
import 'package:bloomsai/app/common/widget/others/custome_textfield.dart';
import 'package:bloomsai/app/controller/provider/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({Key? key}) : super(key: key);

  @override
  _UpdateViewState createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Complete Your Profile',
          style: AppTextStyles.body14,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 3.h),
          Image.asset(
            ImageAssets.profile_edit,
            height: 15.h,
          ),
          SizedBox(height: 2.h),
          Text('Name', style: AppTextStyles.small12.copyWith(height: 2.0)),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<ProfileProvider>().fullNameController,
            keyboardType: TextInputType.name,
            obscureText: false,
            hintText: 'John Bull',
            prefixIcon: Icon(
              IconlyLight.profile,
            ),
          ),
          SizedBox(height: 1.h),
          Text('Email', style: AppTextStyles.small12.copyWith(height: 2.0)),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<ProfileProvider>().emailController,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            hintText: 'johnbull@gmail.com',
            prefixIcon: Icon(
              IconlyLight.message,
            ),
          ),
          SizedBox(height: 1.h),
          Text('Address', style: AppTextStyles.small12.copyWith(height: 2.0)),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<ProfileProvider>().addressController,
            keyboardType: TextInputType.streetAddress,
            obscureText: false,
            hintText: 'update Address',
            prefixIcon: Icon(
              IconlyLight.location,
            ),
          ),
          SizedBox(height: 1.h),
          Text('Phone', style: AppTextStyles.small12.copyWith(height: 2.0)),
          CustomTextField(
            padding: 16.sp,
            controller: context.read<ProfileProvider>().phoneController,
            keyboardType: TextInputType.phone,
            obscureText: false,
            hintText: '+237 6xxxxxxx',
            prefixIcon: Icon(
              IconlyLight.call,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),
                  title: Text(
                    'Male',
                    style: AppTextStyles.small12,
                  ), // The text displayed next to the radio button
                  value: 'Male', // The value associated with the radio button
                  groupValue: context
                      .read<ProfileProvider>()
                      .selectedValue, // The currently selected value of the radio group
                  onChanged: (value) {
                    setState(() {
                      context.read<ProfileProvider>().selectedValue =
                          value.toString();
                    });
                  }, // Update the selected value
                ),
              ),
              Expanded(
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),
                  title: Text(
                    'Female',
                    style: AppTextStyles.small12,
                  ), // The text displayed next to the radio button
                  value: 'Female', // The value associated with the radio button
                  groupValue: context
                      .read<ProfileProvider>()
                      .selectedValue, // The currently selected value of the radio group
                  onChanged: (value) {
                    setState(() {
                      context.read<ProfileProvider>().selectedValue =
                          value.toString();
                    });
                  }, // Update the selected value
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          CustomButton(
            status: false,
            onTap: () {},
            buttonText: "Save",
          )
        ],
      ),
    );
  }
}
