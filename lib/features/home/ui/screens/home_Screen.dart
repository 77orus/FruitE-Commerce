import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/widgets/custom_app_bar.dart';
import 'package:fruietecommerceapp/features/home/ui/widgets/home_scren_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, title: "الصفحة الرئيسية"),
      body: const HomeScreenBody(),
    );
  }
}
