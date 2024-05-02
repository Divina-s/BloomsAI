

import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';

class Constants {
 static void snackMessage({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    content: Text(message,
        style: AppTextStyles.small12.copyWith(color: AppColors.whiteColor)),
    backgroundColor: AppColors.primaryColor,
  ));
}

static void snackErrorMessage({required String message,required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: AppTextStyles.small12.copyWith(color: AppColors.whiteColor)
    ),
    backgroundColor: AppColors.red,
  ));
}
}

class AppStrings{
  static const String chatHistoryBox = 'chat_history';
  static const String userBox = 'user_box';
  static const String settingsBox = 'settings';
  static const String bloomsaiDB = 'bloomsai.db';
  static const String chatMessagesBox = 'chat_messages_';
}