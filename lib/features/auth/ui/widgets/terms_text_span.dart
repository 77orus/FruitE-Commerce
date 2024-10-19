import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';

class TermsTextSpan extends StatelessWidget {
  const TermsTextSpan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على ',
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            TextSpan(
              text: 'الشروط والأحكام',
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            TextSpan(
              text: 'الخاصة',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            TextSpan(
              text: 'بنا',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
