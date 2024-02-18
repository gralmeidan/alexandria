import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../components/components.dart';
import '../../repositories/search.repository.dart';
import '../../routes/app_routes.dart';
import 'widgets/book_header_info.dart';
import 'widgets/minor_details.dart';
import 'widgets/mirrors_list.dart';

class DetailsPage extends StatefulWidget {
  static void push(BuildContext context, BookSearchResult book) {
    Navigator.of(context).pushNamed(
      AppRoutes.DETAILS_PAGE,
      arguments: book,
    );
  }

  const DetailsPage({super.key});

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
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final book = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  right: 16.0,
                  left: 16.0,
                ),
                sliver: SliverList.list(
                  children: [
                    BookHeaderInfo(details: book),
                    const SizedBox(height: 22),
                    MinorDetails(details: book),
                    if (book.description != null) ...[
                      const SizedBox(height: 16),
                      TextExpandable(book.description!),
                    ],
                  ],
                ),
              ),
              if (book.mirrors.isNotEmpty) MirrorsList(mirrors: book.mirrors),
            ],
          );
        },
      ),
    );
  }
}
