import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  TextEditingController textController;
  String validatorText;
  String fieldName;
  TextInputType? keyboard;

  InputField({
    required this.textController,
    required this.validatorText,
    required this.fieldName,
    this.keyboard,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      // autovalidateMode: AutovalidateMode.disabled,
      keyboardType: keyboard,
      validator: (value) {
    return value != null && value.length < 6
        ? validatorText
        : null;
  },
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(fieldName)),
    );
  }
}


// ignore: must_be_immutable
class InputEmailField extends StatelessWidget {
  TextEditingController textController;
  String validatorText;
  String fieldName;
  TextInputType? keyboard;

  InputEmailField({
    required this.textController,
    required this.validatorText,
    required this.fieldName,
    this.keyboard,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      // autovalidateMode: AutovalidateMode.disabled,
      keyboardType: keyboard,
      validator: (value) {
        return value != null &&
                !EmailValidator.validate(value)
            ? 'Enter a valid email'
            : null;
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(fieldName)),
    );
  }
}
