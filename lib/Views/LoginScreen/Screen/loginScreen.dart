import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Views/BottomNavigationScreen/bottomNavigation_Screen.dart';
import 'package:my_project/Views/ForgetPassword/Screen/forgetPassword_screen.dart';
import 'package:my_project/Views/RegisterScreen/Screen/register_screen.dart';
import 'package:my_project/Widgets/custom_button.dart';
import 'package:my_project/Widgets/custom_text.dart';
import 'package:my_project/Widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

import '../../../Utils/app_colors.dart';
import '../Provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0).w,
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_sharp,
                            color: AppColors.black)),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45.h,
                          width: 155.w,
                          alignment: Alignment.center,
                          child: CustomText(
                              text: AppConstants.signIn,
                              color: AppColors.white,
                              size: 18.sp,
                              weight: FontWeight.bold),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(40).w),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: Container(
                            height: 45.h,
                            width: 155.w,
                            alignment: Alignment.center,
                            child: CustomText(
                                text: AppConstants.signUp,
                                color: Colors.blueGrey,
                                size: 16.sp,
                                weight: FontWeight.bold),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(40).w),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    CustomText(
                        text: AppConstants.signIn,
                        color: AppColors.black,
                        size: 22.sp,
                        weight: FontWeight.bold),
                    SizedBox(height: 30.h),
                    MyTextFormField(
                      controller: loginProvider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined,
                          color: AppColors.black, size: 20.sp),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter Email";
                        } else if (!emailRegex.hasMatch(p0)) {
                          return 'Enter a Valid Email';
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter Your Email",
                    ),
                    SizedBox(height: 30.h),
                    MyTextFormField(
                      controller: loginProvider.passwordController,
                      obscureText: loginProvider.isVisible ? false : true,
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: AppColors.black, size: 20.sp),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          loginProvider.visibility();
                        },
                        child: Icon(
                            loginProvider.isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.black,
                            size: 20.sp),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter Password";
                        } else if (p0.length < 6) {
                          return 'Password should be greater than 6';
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter Your Password",
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(ForgetScreen());
                          },
                          child: CustomText(
                              text: AppConstants.forgotPassword,
                              color: Colors.blueGrey,
                              size: 16.sp,
                              weight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            loginProvider.signIn();
                            Get.showSnackbar(GetSnackBar(
                              message: AppConstants.loginSuccessfully,
                              duration: Duration(seconds: 2),
                              backgroundColor: AppColors.green,
                              snackPosition: SnackPosition.TOP,
                              dismissDirection: DismissDirection.up,
                            ));
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationScreen()));
                          }
                          ;
                        },
                        child: loginProvider.isLoading
                            ? Center(
                                child: SpinKitCircle(color: Colors.blueGrey))
                            : CustomButton(text: AppConstants.signIn)),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: AppConstants.notHaveAnAccount),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: CustomText(
                              text: AppConstants.signUp,
                              color: Colors.blueGrey,
                              size: 17.sp,
                              weight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
