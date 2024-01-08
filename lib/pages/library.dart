import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import 'cubit/search_cubit.dart';
import 'widgets/hyperlink.dart';
import 'widgets/library_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        QueryCubit.provider(),
        SearchCubit.provider(),
      ],
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
                      context.search.openSearch();
                    },
                  ),
                );
              },
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (_, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.groups.length,
                    itemBuilder: (_, index) {
                      final group = state.groups[index];

                      return ExpansionTile(
                        title: Text(group.title),
                        children: [
                          for (var book in group.results)
                            ListTile(
                              title: Text(book.title),
                              subtitle: Text(book.author.name),
                              onTap: () {
                                print(book.title);
                              },
                            ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
