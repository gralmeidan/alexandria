import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextAlign textAlign;

  const Hyperlink({
    Key? key,
    required this.label,
    required this.onPressed,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
