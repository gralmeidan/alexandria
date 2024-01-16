import 'package:flutter/material.dart';

class AtomColoredLabel extends StatelessWidget {
  final String label;
  final double horizontalPadding;

  const AtomColoredLabel(
    this.label, {
    super.key,
    this.horizontalPadding = 6,
  });

  const AtomColoredLabel.length(
    int length, {
    super.key,
  })  : label = length > 9 ? '9+' : '$length',
        horizontalPadding = length > 9 ? 4 : 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 4,
      ),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
