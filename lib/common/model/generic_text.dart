import 'package:formz/formz.dart';

enum GenericTextError { invalid }

class GenericText extends FormzInput<String, GenericTextError> {
  const GenericText.pure([String value = '']) : super.pure(value);
  const GenericText.dirty({required String value}) : super.dirty(value);

  @override
  GenericTextError? validator(String value) {
    return value.isEmpty ? GenericTextError.invalid : null;
  }
}

extension GenericTextErrorExtension on GenericTextError {
  String text() {
    switch (this) {
      case GenericTextError.invalid:
        return 'Bitte eine gültigen Text eingeben';
    }
  }
}
