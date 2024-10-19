import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/images/imagesApp.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.isCheckedChange,
  });

  final bool isChecked;
  final ValueChanged<bool> isCheckedChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isCheckedChange(!isChecked);
      },
      child: AnimatedContainer(
        height: 24,
        width: 24,
        duration: const Duration(milliseconds: 300),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50,
                color: isChecked
                    ? AppColors.primaryColor
                    : const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked ? SvgPicture.asset(Assets.imagesCheck) : Container(),
      ),
    );
  }
}
