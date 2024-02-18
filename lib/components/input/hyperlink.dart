import 'package:flutter/material.dart';

import '../../styles/text.dart';

class Hyperlink extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextAlign textAlign;

  const Hyperlink({
    super.key,
    required this.label,
    required this.onPressed,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: textAlign,
        style: AppStyle.bodyLarge(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
