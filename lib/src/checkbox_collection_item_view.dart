import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxDefaultView extends StatefulWidget {
  final int index;
  final void Function(int, bool) onValueChange;
  final Widget detailView;
  final bool showCheckBox;

  const CheckBoxDefaultView({
    Key? key,
    required this.index,
    required this.detailView,
    required this.showCheckBox,
    required this.onValueChange,
  }) : super(key: key);

  @override
  _CheckBoxDefaultViewState createState() =>
      _CheckBoxDefaultViewState();
}

class _CheckBoxDefaultViewState extends State<CheckBoxDefaultView> {
  var _isChecked = false;

  void _changeAndNotify(bool? value) {
    widget.onValueChange(widget.index, value!);
    setState(() {
      _isChecked = value;
    });
  }

  Widget _getCheckBoxListTile() {
    return Checkbox(
      value: _isChecked,
      onChanged: _changeAndNotify
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _changeAndNotify(!_isChecked);
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: widget.detailView,
              ),
              widget.showCheckBox ? _getCheckBoxListTile() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
