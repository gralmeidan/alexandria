import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../stores/search/results.store.dart';
import '../../styles/text.dart';
import 'widgets/book_card/book_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: BlocBuilder<ResultsCubit, SearchState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final groups = state.groupEntries;

          return SizedBox(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (_, index) {
                final group = groups[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(
                        group.key,
                        style: const AppStyle.titleLarge(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 286,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: group.value.length,
                        itemBuilder: (_, index) {
                          final books = group.value[index];

                          return SearchBookCard(
                            books,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
