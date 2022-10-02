import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/common/provider/providers.dart';
import 'package:qualifighting_mobile/common/provider/theme/theme_provider.dart';
import 'package:qualifighting_mobile/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => MaterialApp(
        themeMode: ref.watch(getThemeProvider),
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}
