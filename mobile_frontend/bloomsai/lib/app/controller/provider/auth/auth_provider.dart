import 'dart:async';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final confirmPassworController = TextEditingController();

  void clear() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
    phoneController.clear();
    confirmPassworController.clear();
    otpController.clear();
  }
}
