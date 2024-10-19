import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasUpperCase,
      required this.hasLowerCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength});

  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildValidationRow(
            isValid: hasUpperCase, text: "يجب ان تحتوي علي الأقل علي حرف كبير"),
        const SizedBox(height: 6),
        BuildValidationRow(
            isValid: hasLowerCase, text: "يجب ان تحتوي علي الأقل علي حرف صغير"),
        const SizedBox(height: 6),
        BuildValidationRow(
            isValid: hasNumber, text: "يجب ان تحتوي علي الأقل علي رقم"),
        const SizedBox(height: 6),
        BuildValidationRow(
            isValid: hasSpecialCharacter,
            text: "يجب ان تحتوي علي الأقل علي رمز"),
        const SizedBox(height: 6),
        BuildValidationRow(
            isValid: hasMinLength, text: "يجب ان تحتوي علي الأقل علي 8 حروف"),
      ],
    );
  }
}

class BuildValidationRow extends StatelessWidget {
  const BuildValidationRow(
      {super.key, required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2,
          backgroundColor: Colors.green,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : AppColors.greyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Cairo',
            decoration: isValid ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
