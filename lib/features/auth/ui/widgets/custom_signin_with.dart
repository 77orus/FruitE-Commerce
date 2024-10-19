import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';
import 'package:svg_flutter/svg.dart';

class CustomSignInWith extends StatelessWidget {
  const CustomSignInWith({
    super.key,
    required this.text,
    required this.onPressed,
    required this.image,
  });

  final String text;
  final VoidCallback? onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            side: BorderSide(
              width: 1,
              color: AppColors.greyColor,
            ),
          ),
        ),
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
          leading: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
