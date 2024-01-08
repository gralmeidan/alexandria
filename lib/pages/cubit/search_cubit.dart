import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../repositories/search.repository.dart';

class QueryCubit extends Cubit<String> {
  QueryCubit() : super('');

  void updateSearch(String value) {
    emit(value);
  }

  static BlocProvider<QueryCubit> provider({
    Key? key,
    Widget? child,
  }) {
    return BlocProvider<QueryCubit>(
      key: key,
      create: (_) => QueryCubit(),
      child: child,
    );
  }
}

class SearchCubit extends Cubit<SearchState> {
  final BuildContext context;

  SearchCubit(this.context) : super(SearchState());

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

  static BlocProvider<SearchCubit> provider({
    Key? key,
    Widget? child,
  }) {
    return BlocProvider<SearchCubit>(
      key: key,
      create: (context) => SearchCubit(context),
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

extension SearchCubitX on BuildContext {
  QueryCubit get query => read<QueryCubit>();
  SearchCubit get search => read<SearchCubit>();
}
