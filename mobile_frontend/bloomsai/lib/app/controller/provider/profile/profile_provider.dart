import 'package:flutter/material.dart';


class ProfileProvider extends ChangeNotifier{
   final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPassworController = TextEditingController();
    final feedbackController = TextEditingController();
   String selectedValue ="";
   String selectedLanguage ="";

   void clear() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
    phoneController.clear();
    confirmPassworController.clear();
    addressController.clear();
  }
}