import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/features/splash_screen/ui/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
