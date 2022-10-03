import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/common/provider/providers.dart';
import 'package:qualifighting_mobile/common/provider/theme/theme_provider.dart';
import 'package:qualifighting_mobile/common/router/app_router.dart';
import 'package:qualifighting_mobile/common/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        themeMode: ref.watch(getThemeProvider),
        darkTheme: ThemeData.dark(),
        theme: materialTheme,
      ),
    );
  }
}
