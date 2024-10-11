import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/features/auth/ui/screens/login_screen.dart';
import 'package:fruietecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:fruietecommerceapp/features/splash_screen/ui/screens/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
