import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxDefaultView extends StatelessWidget {
  final int index;
  final void Function(int, bool) onValueChange;
  final Widget detailView;
  final bool isChecked;
  final bool multiSelect;
  final bool showButton;

  const CheckBoxDefaultView({
    Key? key,
    required this.index,
    required this.detailView,
    required this.isChecked,
    required this.multiSelect,
    required this.showButton,
    required this.onValueChange,
  }) : super(key: key);

  void _changeAndNotify() {
    onValueChange(index, !isChecked);
  }

  Widget _getCheckbox() {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        _changeAndNotify();
      },
    );
  }

  Widget _getRadio() {
    return Radio(
      value: index,
      groupValue: isChecked ? index : -1,
      onChanged: (value) {
        _changeAndNotify();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _changeAndNotify();
        },
        child: Row(
          children: [
            Expanded(
              child: detailView,
            ),
            showButton ? (multiSelect ? _getCheckbox() : _getRadio()) : Container(),
          ],
        ),
      ),
    );
  }
}
