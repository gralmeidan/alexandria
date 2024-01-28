// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppStyle extends TextStyle {
  static const HeadlineLarge = AppStyle.headlineLarge();

  const AppStyle.headlineLarge({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 32.0, height: 1.25);

  const AppStyle.headlineMedium({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 28.0, height: 1.29);

  const AppStyle.headlineSmall({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 24.0, height: 1.33);

  const AppStyle.titleLarge({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 22.0, height: 1.27);

  const AppStyle.titleMedium({
    super.color,
    super.fontWeight = FontWeight.w500,
  }) : super(fontSize: 16.0, height: 1.5);

  const AppStyle.titleSmall({
    super.color,
    super.fontWeight = FontWeight.w500,
  }) : super(fontSize: 14.0, height: 1.43);

  const AppStyle.bodyLarge({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 16.0, height: 1.5);

  const AppStyle.bodyMedium({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 14.0, height: 1.43);

  const AppStyle.bodySmall({
    super.color,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 12.0, height: 1.33);

  const AppStyle.labelLarge({
    super.color,
    super.fontWeight = FontWeight.w500,
  }) : super(fontSize: 14.0, height: 1.43);

  const AppStyle.labelMedium({
    super.color,
    super.fontWeight = FontWeight.w500,
  }) : super(fontSize: 12.0, height: 1.33);

  const AppStyle.labelSmall({
    super.color,
    super.fontWeight = FontWeight.w500,
  }) : super(fontSize: 11.0, height: 1.45);

  const AppStyle.subTitleLarge({
    super.color = Colors.grey,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 16.0, height: 1.33);

  const AppStyle.subTitleMedium({
    super.color = Colors.grey,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 14.0, height: 1.5);

  const AppStyle.subTitleSmall({
    super.color = Colors.grey,
    super.fontWeight = FontWeight.w400,
  }) : super(fontSize: 12.0, height: 1.43);
}

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    super.headlineLarge = const AppStyle.headlineLarge(),
    super.headlineMedium = const AppStyle.headlineMedium(),
    super.headlineSmall = const AppStyle.headlineSmall(),
    super.titleLarge = const AppStyle.titleLarge(),
    super.titleMedium = const AppStyle.titleMedium(),
    super.titleSmall = const AppStyle.titleSmall(),
    super.bodyLarge = const AppStyle.bodyLarge(),
    super.bodyMedium = const AppStyle.bodyMedium(),
    super.bodySmall = const AppStyle.bodySmall(),
    super.labelLarge = const AppStyle.labelLarge(),
    super.labelMedium = const AppStyle.labelMedium(),
    super.labelSmall = const AppStyle.labelSmall(),
  });
}
