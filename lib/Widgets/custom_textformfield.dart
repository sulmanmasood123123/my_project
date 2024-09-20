// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? hintText;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextStyle? style;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText = false;
  MyTextFormField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        style: TextStyle(color: Colors.black),
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black),
                borderRadius: BorderRadius.circular(10.w)),
            suffixIcon: suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(10.w)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10.w))));
  }
}
