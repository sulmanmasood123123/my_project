import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';

import '../../../Utils/app_colors.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void visibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  void signIn() async {
    try {
      loading(true);
      await auth.signInWithEmailAndPassword(
          email: emailController.text.trim().toString(),
          password: passwordController.text.trim().toString());
      loading(false);
      clearControllers();
      Get.showSnackbar(GetSnackBar(
        message: AppConstants.loginSuccessfully,
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.green,
        snackPosition: SnackPosition.TOP,
        dismissDirection: DismissDirection.up,
      ));
    } on FirebaseAuthException catch (e) {
      loading(false);
      String message;
      if (e.code == 'user-not-found')
        message = "No user found for that email.";
      else if (e.code == 'wrong-password') {
        message = "Wrong Password Provided.";
      } else {
        message = "Login Failed. Please try";
      }
      Get.showSnackbar(GetSnackBar(
          message: message,
          backgroundColor: AppColors.red,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.up));
    }
  }
}
