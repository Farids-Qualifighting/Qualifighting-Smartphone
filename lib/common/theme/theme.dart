import 'package:flutter/material.dart';

final materialTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.indigo,
);

final materialThemeDark = ThemeData(
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  appBarTheme: ThemeData.dark().appBarTheme,
  useMaterial3: true,
);
