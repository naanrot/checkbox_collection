import 'package:flutter/material.dart';

class CheckBoxListViewDefault extends StatefulWidget {
  final int index;
  final String title;
  final void Function(int, bool)? onValueChange;

  const CheckBoxListViewDefault({required this.index ,required this.title, void Function(int, bool)? onValueChange,Key? key})
      : this.onValueChange = onValueChange,super(key: key);

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
        if (widget.onValueChange != null) {
          widget.onValueChange!(widget.index, _isChecked);
        }
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }
}