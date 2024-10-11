import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/features/on_boarding/ui/widgets/onboarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'onBoardingScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingBody(),
    );
  }
}
