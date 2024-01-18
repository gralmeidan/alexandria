import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/app_routes.dart';
import 'stores/stores.dart';
import 'styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        QueryCubit.provider(),
        ResultsCubit.provider(),
      ],
      child: MaterialApp(
        title: 'Alexandria',
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: AppColors.background,
        ),
        initialRoute: AppRoutes.HOME,
        routes: AppRoutes.routes,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
