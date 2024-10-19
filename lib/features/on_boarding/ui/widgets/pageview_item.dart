import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';
import 'package:svg_flutter/svg.dart';

class PageviewItem extends StatelessWidget {
  const PageviewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title});

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 32),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16,
        ),
      ],
    );
  }
}
