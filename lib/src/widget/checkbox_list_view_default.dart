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
    return CheckboxListTile(
      title: Text(widget.title),
      value: _isChecked,
      onChanged: (bool? value) {
        _isChecked = !_isChecked;
      },
    );
  }
}