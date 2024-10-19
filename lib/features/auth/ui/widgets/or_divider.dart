import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          "أو",
          style: TextStyles.bold16,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
