import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  const CheckBoxWidget({required this.isChecked, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value){},
    );
  }
}
