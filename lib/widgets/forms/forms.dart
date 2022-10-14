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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(fieldName),
        ),
        TextFormField(
          controller: textController,
          // autovalidateMode: AutovalidateMode.disabled,
          keyboardType: keyboard,
          validator: (value) {
            return value != null && value.length < 6 ? validatorText : null;
          },
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "********"),
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(fieldName),
        ),
        TextFormField(
          controller: textController,
          // autovalidateMode: AutovalidateMode.disabled,
          keyboardType: keyboard,
          validator: (value) {
            return value != null && !EmailValidator.validate(value)
                ? 'Enter a valid email'
                : null;
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "Johnkennedy.royce@gmail.com"),
        ),
      ],
    );
  }
}
