import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/helpers/cache_helper.dart';
import 'package:fruietecommerceapp/core/images/imagesApp.dart';
import 'package:fruietecommerceapp/features/auth/ui/screens/login_screen.dart';
import 'package:fruietecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    executeFunctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPattern),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesPlant,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeFunctions() {
    Future.delayed(const Duration(seconds: 3), () {
      if (CacheHelper.getData(key: "onBoarding") == true) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }
    });
  }
}
