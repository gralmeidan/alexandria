import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

class BookCard extends StatelessWidget {
  final BookSearchGroup group;

  const BookCard(
    this.group, {
    super.key,
  });

  BookSearchResult get book => group.results.first;

  @override
  Widget build(BuildContext context) {
    Widget? coverLabel;

    if (group.results.length > 1) {
      coverLabel = Align(
        alignment: Alignment.topRight,
        child: _AtomResultsLength(group.results.length),
      );
    }

    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 160,
        child: Column(
          children: [
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(book.cover ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: coverLabel,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.author.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AtomResultsLength extends StatelessWidget {
  final String label;
  final double horizontalPadding;

  const _AtomResultsLength(
    int length,
  )   : label = length > 9 ? '9+' : '$length',
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
