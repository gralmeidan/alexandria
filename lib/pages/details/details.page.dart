import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../components/components.dart';
import '../../repositories/search.repository.dart';
import '../../routes/app_routes.dart';

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
  String title = '';
  Future<BookDetails>? detailsFuture;

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
      body: Center(
        child: Text('No book selected'),
      ),
    );
  }
}
