import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxDefaultView extends StatefulWidget {
  final int index;
  final void Function(int, bool) onValueChange;
  final Widget detailView;
  final bool isChecked;

  const CheckBoxDefaultView({
    Key? key,
    required this.index,
    required this.detailView,
    required this.isChecked,
    required this.onValueChange,
  }) : super(key: key);

  @override
  _CheckBoxDefaultViewState createState() =>
      _CheckBoxDefaultViewState(isChecked: isChecked);
}

class _CheckBoxDefaultViewState extends State<CheckBoxDefaultView> {
  bool _isChecked;

  _CheckBoxDefaultViewState({required bool isChecked})
      : this._isChecked = isChecked;

  void _changeAndNotify(bool? value) {
    widget.onValueChange(widget.index, value!);
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _changeAndNotify(!_isChecked);
        },
        child: widget.detailView,
      ),
    );
  }
}