import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Views/LoginScreen/Screen/loginScreen.dart';

import '../../../Utils/app_colors.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  bool _isVisible2 = false;
  bool get isVisible2 => _isVisible2;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void visibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void visibility2() {
    _isVisible2 = !_isVisible2;
    notifyListeners();
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }

  void signUp() async {
    try {
      loading(true);
      await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim().toString(),
          password: passwordController.text.trim().toString());
      loading(false);
      clearControllers();
      Get.showSnackbar(GetSnackBar(
        message: AppConstants.registerSuccessfully,
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
