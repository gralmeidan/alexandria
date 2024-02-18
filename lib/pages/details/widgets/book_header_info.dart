import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../../components/components.dart';
import '../../../styles/text.dart';

class BookHeaderInfo extends StatelessWidget {
  final BookDetails details;

  const BookHeaderInfo({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClippedImage(
          url: details.cover ?? '',
          width: 100,
          height: 150,
        ),
        const SizedBox(width: 22),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSpan(
                title: details.title,
                edition: details.edition,
              ),
              if (details.publisher.isNotEmpty)
                Text(
                  details.publisher,
                  style: const AppStyle.subTitleMedium(),
                ),
              if (details.author.name.isNotEmpty)
                Text(
                  details.author.name,
                  style: const AppStyle.subTitleMedium(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
