import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

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
      body: Center(
        child: SizedBox(),
      ),
    );
  }
}
