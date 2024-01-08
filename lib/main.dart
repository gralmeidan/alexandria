import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexandria',
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.black38,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: AppRoutes.HOME,
      routes: AppRoutes.routes,
      themeMode: ThemeMode.dark,
    );
  }
}
