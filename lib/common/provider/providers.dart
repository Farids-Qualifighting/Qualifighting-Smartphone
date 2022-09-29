import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError('SharedPreferenceProvider not implemented'),
);
