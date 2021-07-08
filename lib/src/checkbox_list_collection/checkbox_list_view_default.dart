import 'package:flutter/material.dart';

class CheckBoxListViewDefault extends StatefulWidget {
  final int index;
  final String title;
  final void Function(int, bool) onValueChange;

  const CheckBoxListViewDefault(
      {Key? key,
      required this.index,
      required this.title,
      required this.onValueChange})
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
        widget.onValueChange(widget.index, value!);
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }
}
