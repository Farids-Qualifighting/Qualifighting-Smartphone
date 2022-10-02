import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/common/provider/theme/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(getThemeProvider.notifier).changeThemeMode(
                      ref.read(getThemeProvider) == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}
