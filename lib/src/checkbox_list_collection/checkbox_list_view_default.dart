import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxListViewDefault extends StatefulWidget {
  final int index;
  final void Function(int, bool) onValueChange;
  final Widget detailView;

  CheckBoxListViewDefault({Key? key,
    required this.index,
    required this.detailView,
    required this.onValueChange}) : super(key: key);

  @override
  _CheckBoxListViewDefaultState createState() =>
      _CheckBoxListViewDefaultState();
}

class _CheckBoxListViewDefaultState extends State<CheckBoxListViewDefault> {
  var _isChecked = false;

  void _changeAndNotify(bool value) {
    widget.onValueChange(widget.index, value);
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  Widget _getCheckBoxListTile() {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) {
        _changeAndNotify(value!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _changeAndNotify(!_isChecked);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: widget.detailView,
            ),
            _getCheckBoxListTile()
          ],
        ),
      ),
    );
  }
}
