import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/features/auth/ui/screens/login_screen.dart';
<<<<<<< HEAD
import 'package:fruietecommerceapp/features/auth/ui/screens/register_screen.dart';
import 'package:fruietecommerceapp/features/home/ui/screens/home_Screen.dart';
=======
>>>>>>> 5771338dd9c42a6b6cd6322dd2a509178688f089
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
<<<<<<< HEAD
    case RegisterScreen.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
=======
>>>>>>> 5771338dd9c42a6b6cd6322dd2a509178688f089
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
