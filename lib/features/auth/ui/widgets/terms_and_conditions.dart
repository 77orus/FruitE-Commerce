import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/core/widgets/custom_check_box.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/terms_text_span.dart';

class TermsAndConditions extends StatefulWidget {
  final ValueChanged<bool> isCheckedChange;

  const TermsAndConditions({
    super.key,
    required this.isCheckedChange,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isCheckedChange: (value) {
            isTermsAccepted = value;
            widget.isCheckedChange(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        const TermsTextSpan(),
      ],
    );
  }
}
