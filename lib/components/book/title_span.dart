import 'package:flutter/material.dart';

import '../../styles/text.dart';

class TitleSpan extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String? edition;
  final TextStyle editionStyle;

  const TitleSpan({
    required this.title,
    required this.edition,
    this.titleStyle = const TextStyle(),
    this.editionStyle = const TextStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const AppStyle.titleLarge().merge(titleStyle),
        children: [
          if (edition != null && edition!.isNotEmpty)
            TextSpan(
              text: ' ($edition)',
              style: const AppStyle.titleMedium(
                color: Colors.grey,
              ).merge(editionStyle),
            ),
        ],
      ),
    );
  }
}
