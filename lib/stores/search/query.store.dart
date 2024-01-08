import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

extension QueryContext on BuildContext {
  QueryCubit get query => BlocProvider.of<QueryCubit>(this);
}
