import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../repositories/search.repository.dart';
import 'query.store.dart';

class ResultsCubit extends Cubit<SearchState> {
  final BuildContext context;

  ResultsCubit(this.context) : super(SearchState());

  void openSearch() async {
    state.groups.clear();
    state.isSearchOpen = true;
    emit(state);

    final groups = await SearchRepository.search(
      context.query.state,
    );

    state.groups.addAll(groups);
    emit(state);
  }

  void closeSearch() {
    state.groups.clear();
    state.isSearchOpen = false;

    emit(state);
  }

  static BlocProvider<ResultsCubit> provider({
    Key? key,
    Widget? child,
  }) {
    return BlocProvider<ResultsCubit>(
      key: key,
      create: (context) => ResultsCubit(context),
      child: child,
    );
  }
}

class SearchState {
  final List<BookSearchGroup> groups = [];
  bool isSearchOpen = false;

  String queryOf(BuildContext context) {
    return context.query.state;
  }
}

extension ResultsContext on BuildContext {
  ResultsCubit get search => read<ResultsCubit>();
}
