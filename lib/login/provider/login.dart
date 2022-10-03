import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qualifighting_mobile/common/model/generic_text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';
part 'login_state.dart';

@riverpod
class Login extends _$Login with FormzMixin {
  @override
  LoginState build() {
    return const LoginState();
  }

  void changeEmail({required String value}) {
    final name = GenericText.dirty(value: value);

    state = state.copyWith(email: name);
    state = state.copyWith(status: Formz.validate(inputs));
  }

  void changePassword({required String value}) {
    final password = GenericText.dirty(value: value);

    state = state.copyWith(password: password);
    state = state.copyWith(status: Formz.validate(inputs));
  }

  FutureOr<void> submit() {}

  @override
  List<FormzInput> get inputs => [state.email, state.password];
}
