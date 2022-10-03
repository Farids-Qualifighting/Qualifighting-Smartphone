import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?);

class GenericTextFormField extends StatelessWidget {
  const GenericTextFormField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final ValidatorFunction validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
    );
  }
}
