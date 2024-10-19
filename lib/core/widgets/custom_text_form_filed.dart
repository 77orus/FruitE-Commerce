import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        fillColor: const Color(0xFFF9FAFA),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold16.copyWith(
          color: AppColors.greyColor,
        ),
        enabledBorder: OutLineInputBorder(),
        border: OutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder OutLineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
      borderSide: BorderSide(
        width: 1,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color.fromARGB(255, 208, 209, 209),
      ),
    );
  }
}
