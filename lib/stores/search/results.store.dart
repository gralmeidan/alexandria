import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import '../../repositories/search.repository.dart';
import '../../routes/app_routes.dart';
import 'query.store.dart';

class ResultsCubit extends Cubit<SearchState> {
  final BuildContext context;

  ResultsCubit(this.context) : super(SearchState());

  void openSearch(BuildContext context) async {
    emit(SearchState());

    Navigator.of(context).pushNamed(AppRoutes.SEARCH_PAGE);

    final groups = await SearchRepository.search(
      context.query.state,
    );
    log('Finish search');

    emit(SearchState(isLoading: false, groups: groups));
  }

  void closeSearch() {
    emit(SearchState());

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
  final List<BookSearchGroup> groups;
  final bool isLoading;

  SearchState({
    this.groups = const [],
    this.isLoading = true,
  });

  String queryOf(BuildContext context) {
    return context.query.state;
  }
}

extension ResultsContext on BuildContext {
  ResultsCubit get search => read<ResultsCubit>();
}
