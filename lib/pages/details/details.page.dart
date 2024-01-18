import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../components/book/title_span.dart';
import '../../components/components.dart';
import '../../components/container/clipped_image.dart';
import '../../components/text/text_expandable.dart';
import '../../helpers/helpers.dart';
import '../../repositories/search.repository.dart';
import '../../routes/app_routes.dart';
import 'widgets/minor_details/minor_details.dart';

class DetailsPage extends StatefulWidget {
  static void push(BuildContext context, BookSearchResult book) {
    Navigator.of(context).pushNamed(
      AppRoutes.DETAILS_PAGE,
      arguments: book,
    );
  }

  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<BookDetails>? detailsFuture;
  String title = '';

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is BookSearchResult) {
      setState(() {
        title = args.title;
      });

      detailsFuture = SearchRepository.details(args);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: title,
      ),
      body: FutureBuilder(
        future: detailsFuture,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final book = snapshot.data!;

            return ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClippedImage(
                      url: book.cover ?? '',
                      width: 100,
                      height: 150,
                    ),
                    const SizedBox(width: 22),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleSpan(
                            title: book.title,
                            edition: book.edition,
                          ),
                          if (book.publisher.isNotEmpty)
                            Text(
                              book.publisher,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          if (book.author.name.isNotEmpty)
                            Text(
                              book.author.name,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacing(height: 12),
                MinorDetails(details: book),
                if (book.description != null)
                  TextExpandable(
                    book.description!,
                  ),
                // Mirrors
                if (book.mirrors.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Mirrors'),
                        const Spacing(
                          child: Divider(),
                        ),
                        for (final mirror in book.mirrors) ...[
                          InkWell(
                            onTap: () {},
                            child: Text(
                              mirror.label,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ].toWidgetList(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
