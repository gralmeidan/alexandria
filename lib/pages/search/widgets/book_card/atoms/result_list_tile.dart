import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/models/search.dart';

import '../../../../../styles/text.dart';

class AtomResultListTile extends StatelessWidget {
  final BookSearchResult book;
  final VoidCallback? onTap;

  const AtomResultListTile(
    this.book, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book.cover ?? '',
                height: 90,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: book.title,
                              ),
                              if (book.edition.isNotEmpty)
                                TextSpan(
                                  text: ' (${book.edition})',
                                  style: const AppStyle.subTitleSmall(),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        book.year.toString(),
                        style: const AppStyle.subTitleSmall(),
                      ),
                    ],
                  ),
                  Text(
                    book.author.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const AppStyle.subTitleSmall(),
                  ),
                  Text(
                    book.publisher,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const AppStyle.subTitleSmall(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text(
                          '${book.pages} pages - ${book.language}',
                          style: const AppStyle.subTitleSmall(),
                        ),
                      ),
                      Text(
                        '${book.filesize} (${book.filetype})',
                        style: const AppStyle.subTitleSmall(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
