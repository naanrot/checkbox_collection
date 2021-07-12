import 'package:flutter/material.dart';

const value = 1;
const groupValue = 2;

class RadioButtonWidget extends StatelessWidget {
  final bool isChecked;
  const RadioButtonWidget({required this.isChecked, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(
      groupValue: isChecked ? value : groupValue,
      value: value,
      onChanged: (value){},
    );
  }
}
