import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Views/LoginScreen/Screen/loginScreen.dart';

import '../../../Utils/app_colors.dart';

class ForgotProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clearControllers() {
    emailController.clear();
    notifyListeners();
  }

  void resetPassword() async {
    try {
      loading(true);
      await auth.sendPasswordResetEmail(
          email: emailController.text.trim().toString());
      loading(false);
      clearControllers();
      Get.showSnackbar(GetSnackBar(
        message: AppConstants.checkEmail,
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.green,
        snackPosition: SnackPosition.TOP,
        dismissDirection: DismissDirection.up,
      ));
      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      loading(false);
      Get.showSnackbar(GetSnackBar(
          message: e.toString(),
          backgroundColor: AppColors.red,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.up));
    }
  }
}
