import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/home/repository/dummy.dart';

part 'home_provider.freezed.dart';
part 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>(
  (ref) => HomeProvider(
    const HomeState(),
    homeRepository: ref.watch(homeRepository),
  ),
);

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(super.state, {required this.homeRepository});

  final HomeRepository homeRepository;

  void doSomething({required String b}) {
    homeRepository.bla();

    state = state.copyWith(dummy: b);
  }
}
