part of 'home_provider.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String dummy,
  }) = _HomeState;
}
