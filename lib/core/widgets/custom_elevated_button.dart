import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
<<<<<<< HEAD
        style: TextStyles.bold16.copyWith(color: Colors.white),
=======
        style: TextStyles.subTitle.copyWith(color: Colors.white),
>>>>>>> 5771338dd9c42a6b6cd6322dd2a509178688f089
      ),
    );
  }
}
