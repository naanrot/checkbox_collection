import 'package:flutter/material.dart';

class CheckBoxListViewDefault extends StatefulWidget {
  final String title;

  const CheckBoxListViewDefault({required this.title, Key? key})
      : super(key: key);

  @override
  _CheckBoxListViewDefaultState createState() =>
      _CheckBoxListViewDefaultState();
}

class _CheckBoxListViewDefaultState extends State<CheckBoxListViewDefault> {
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return getDefault(widget.title, _isChecked, (bool? value) {
      _isChecked = !_isChecked;
    });
  }
}

Widget getDefault(title, value, void Function(bool?) onChanged) {
  return CheckboxListTile(
    title: Text(title),
    value: value,
    onChanged: onChanged,
  );
}
