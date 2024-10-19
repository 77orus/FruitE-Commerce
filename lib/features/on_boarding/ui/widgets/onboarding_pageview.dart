import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/images/imagesApp.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';
import 'package:fruietecommerceapp/features/on_boarding/ui/widgets/pageview_item.dart';
import 'package:fruietecommerceapp/features/on_boarding/ui/widgets/text_rich.dart';

class OnboardingPageview extends StatelessWidget {
  const OnboardingPageview({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        const PageviewItem(
          backgroundImage: Assets.imagesVector2,
          image: Assets.imagesFruitbasket,
          subTitle:
              "إكتشف تجربة تسوق فريدة مع FruitHUB. استكشف \nمجموعتنا الواسعة من الفواكه الطازجة الممتازة\n واحصل على أفضل العروض والجودة العالية.",
          title: TextRich(),
        ),
        PageviewItem(
          backgroundImage: Assets.imagesVector,
          image: Assets.imagesPineapple,
          subTitle:
              "إكتشف تجربة تسوق فريدة مع FruitHUB.\n استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة\n واحصل على أفضل العروض والجودة العالية.",
          title: Text(
            "أبحث وتسوق",
            style: TextStyles.bold23,
          ),
        ),
      ],
    );
  }
}
