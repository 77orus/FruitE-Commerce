import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';

AppBar BuildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold20,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
