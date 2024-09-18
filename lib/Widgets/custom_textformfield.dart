// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? hintText;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextStyle? style;
  Widget? suffixIcon;
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
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        style: style,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10.r)),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          focusedBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: AppColors.yellow)),
              //border: OutlineInputBorder(
              //borderSide: BorderSide(color: AppColors.white))),
              ),
        ));
  }
}
