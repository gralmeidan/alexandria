import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../stores/stores.dart';
import 'widgets/library_app_bar.dart';
import 'widgets/library_book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BookshelfCubit.provider(
      child: Scaffold(
        appBar: const LibraryAppBar(),
        body: Column(
          children: [
            BlocBuilder<QueryCubit, String>(
              builder: (context, query) {
                if (query.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Center(
                  child: Hyperlink(
                    label: 'Pesquisar "$query"',
                    onPressed: () {
                      context.search.openSearch(context);
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<BookshelfCubit, BookshelfState>(
                builder: (context, state) {
                  if (state.books.isEmpty) {
                    return const Center(
                      child: Text('Nenhum livro encontrado'),
                    );
                  }

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];

                      return LibraryBookCard(
                        cover: book.cover!,
                        title: book.title ?? '',
                        author: book.author ?? '',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
