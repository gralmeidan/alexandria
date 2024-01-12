import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../stores/stores.dart';
import 'widgets/library_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
