import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/routes/on_generate_routes.dart';
import 'package:fruietecommerceapp/features/splash_screen/ui/screens/splash_screen.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
