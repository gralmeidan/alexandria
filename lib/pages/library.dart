import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

import 'cubit/search_cubit.dart';
import 'widgets/library_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return QueryCubit.provider(
      child: Scaffold(
        appBar: const LibraryAppBar(),
        body: Center(
          child: BlocBuilder<QueryCubit, String>(
            builder: (context, query) {
              if (query.isEmpty) {
                return const SizedBox.shrink();
              }

              return TextButton(
                onPressed: () {},
                child: Text(
                  'Procurar "$query" globalmente',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
