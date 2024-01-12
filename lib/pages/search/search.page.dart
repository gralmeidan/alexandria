import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../stores/search/results.store.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: BlocBuilder<ResultsCubit, SearchState>(
        builder: (_, state) {
          print(state.groups.length);
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SizedBox(
            child: ListView.builder(
              itemCount: state.groups.length,
              itemBuilder: (_, index) {
                final group = state.groups[index];

                return Text(group.title);
              },
            ),
          );
        },
      ),
    );
  }
}
