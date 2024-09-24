import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Views/LoginScreen/Screen/loginScreen.dart';
import 'package:my_project/Widgets/custom_button.dart';
import 'package:my_project/Widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../Utils/app_colors.dart';
import '../../../Widgets/custom_textformfield.dart';
import '../Provider/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0).w,
        child: Consumer<RegisterProvider>(
          builder: (context, registerProvider, child) {
            return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Container(
                                height: 45.h,
                                width: 155.w,
                                alignment: Alignment.center,
                                child: CustomText(
                                    text: AppConstants.signIn,
                                    color: Colors.blueGrey,
                                    size: 18.sp,
                                    weight: FontWeight.bold),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(40).w),
                              ),
                            ),
                            Container(
                              height: 45.h,
                              width: 155.w,
                              alignment: Alignment.center,
                              child: CustomText(
                                  text: AppConstants.signUp,
                                  color: Colors.white,
                                  size: 16.sp,
                                  weight: FontWeight.bold),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(40).w),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        CustomText(
                            text: AppConstants.signUp,
                            color: AppColors.black,
                            size: 22.sp,
                            weight: FontWeight.bold),
                        SizedBox(height: 30.h),
                        MyTextFormField(
                          controller: registerProvider.nameController,
                          prefixIcon: Icon(Icons.person,
                              color: AppColors.black, size: 20.sp),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Name";
                            } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(p0)) {
                              return 'Name can only contains letters and space';
                            } else {
                              return null;
                            }
                          },
                          hintText: "Enter Your Name",
                        ),
                        SizedBox(height: 30.h),
                        MyTextFormField(
                          controller: registerProvider.emailController,
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
                          controller: registerProvider.passwordController,
                          obscureText:
                              registerProvider.isVisible ? false : true,
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: AppColors.black, size: 20.sp),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              registerProvider.visibility();
                            },
                            child: Icon(
                                registerProvider.isVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.black,
                                size: 20.sp),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Enter Password";
                            } else if (p0.length < 6) {
                              return 'Password must be greater than 5';
                            } else {
                              return null;
                            }
                          },
                          hintText: "Enter Your Password",
                        ),
                        SizedBox(height: 30.h),
                        MyTextFormField(
                          controller:
                              registerProvider.confirmPasswordController,
                          obscureText:
                              registerProvider.isVisible2 ? false : true,
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: AppColors.black, size: 20.sp),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              registerProvider.visibility2();
                            },
                            child: Icon(
                                registerProvider.isVisible2
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.black,
                                size: 20.sp),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Confirm password is required";
                            } else if (p0.length < 6) {
                              return 'Password must be greater than 5';
                            } else if (p0 !=
                                registerProvider.passwordController.text) {
                              return "Passwords do not match";
                            } else {
                              return null;
                            }
                          },
                          hintText: "Enter Your Confirm Password",
                        ),
                        SizedBox(height: 60.h),
                        GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                registerProvider.signUp();
                              }
                              ;
                            },
                            child: registerProvider.isLoading
                                ? Center(
                                    child:
                                        SpinKitCircle(color: Colors.blueGrey))
                                : CustomButton(text: AppConstants.signUp)),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(text: AppConstants.alreadyHaveAnAccount),
                            InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: CustomText(
                                  text: AppConstants.signIn,
                                  color: Colors.blueGrey,
                                  size: 17.sp,
                                  weight: FontWeight.bold),
                            )
                          ],
                        ),
                      ]),
                ));
          },
        ),
      ),
    );
  }
}
