part of 'login.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(GenericText.pure()) GenericText email,
    @Default(GenericText.pure()) GenericText password,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _LoginState;
}
