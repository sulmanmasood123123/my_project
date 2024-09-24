import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Widgets/custom_button.dart';
import 'package:my_project/Widgets/custom_text.dart';
import 'package:my_project/Widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

import '../../../Utils/app_colors.dart';
import '../Provider/forgetPassword_provider.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0).w,
        child: Consumer<ForgotProvider>(
          builder: (context, forgotProvider, child) {
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
                    SizedBox(height: 35.h),
                    CustomText(
                        text: AppConstants.forgotPasswordTitle,
                        color: AppColors.black,
                        size: 22.sp,
                        weight: FontWeight.bold),
                    SizedBox(height: 30.h),
                    MyTextFormField(
                      controller: forgotProvider.emailController,
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
                    SizedBox(height: 60.h),
                    GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            forgotProvider.resetPassword();
                          }
                          ;
                        },
                        child: forgotProvider.isLoading
                            ? Center(
                                child: SpinKitCircle(color: Colors.blueGrey))
                            : CustomButton(text: AppConstants.resetPassword)),
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
