import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  TextEditingController textController;
  String validatorText;
  String fieldName;
  InputField({
    required this.textController,
    required this.validatorText,
    required this.fieldName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      // autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        return value!.isEmpty ? validatorText : null;
      },
      decoration:
          InputDecoration(border: const OutlineInputBorder(), label: Text(fieldName)),
    );
  }
}
