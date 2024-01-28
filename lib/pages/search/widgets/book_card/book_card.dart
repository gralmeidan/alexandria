import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../../../components/slivers/sliver_fixed_header.dart';
import '../../../../styles/text.dart';
import '../../../details/details.page.dart';
import 'atoms/colored_label.dart';
import 'atoms/result_list_tile.dart';

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
        child: AtomColoredLabel.length(group.results.length),
      );
    }

    return InkWell(
      onTap: () {
        showFlexibleBottomSheet(
          context: context,
          minHeight: 0.2,
          initHeight: 0.6,
          maxHeight: 0.8,
          bottomSheetBorderRadius: BorderRadius.circular(16),
          builder: (_, controller, ___) {
            return Material(
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverFixedHeader(
                      height: 32,
                      child: const Divider(
                        indent: 100,
                        endIndent: 100,
                        thickness: 4,
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: group.results.length,
                    itemBuilder: (_, index) {
                      final book = group.results[index];
                      return AtomResultListTile(
                        book,
                        onTap: () async {
                          DetailsPage.push(
                            context,
                            book,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
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
                  style: const AppStyle.subTitleSmall(
                    color: Colors.grey,
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
