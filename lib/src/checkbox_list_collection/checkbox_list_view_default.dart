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

  Widget _getCheckBoxListTile() {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) {
        widget.onValueChange(widget.index, value!);
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: widget.detailView,
          ),
          _getCheckBoxListTile()
        ],
      ),
    );
  }
}
