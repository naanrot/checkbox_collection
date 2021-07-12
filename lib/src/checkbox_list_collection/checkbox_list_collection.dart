import 'package:flutter/material.dart';

import '../checkbox_collection_item_view.dart';

class CheckBoxListCollection extends StatefulWidget {
  final Widget Function(int, bool) detailViewBuilder;
  final void Function(List<int>) checkedItems;
  final List<int> checkedItemsList;
  final int itemCount;
  final bool showButton;
  final bool multiSelect;

  const CheckBoxListCollection({
    required this.detailViewBuilder,
    required this.checkedItemsList,
    required this.itemCount,
    bool multiSelect = true,
    bool showButton = true,
    required this.checkedItems,
    Key? key,
  }) :  this.showButton = showButton,
        this.multiSelect = multiSelect,
        super(key: key);

  @override
  _CheckBoxListCollectionState createState() => _CheckBoxListCollectionState();
}

class _CheckBoxListCollectionState extends State<CheckBoxListCollection> {
  @override
  Widget build(BuildContext context) {
    bool _isChecked(index) => widget.checkedItemsList.contains(index) ? true : false;

    void _setCheckedItems(i, isChecked) {
      if (widget.multiSelect) {
        isChecked ? widget.checkedItemsList.add(i) : widget.checkedItemsList.remove(i);
      } else {
        widget.checkedItemsList.clear();
        widget.checkedItemsList.add(i);
      }
      setState(() {});
    }

    return ListView.builder(
      itemCount: this.widget.itemCount,
      itemBuilder: (context, index) {
        return CheckBoxDefaultView(
          index: index,
          isChecked: _isChecked(index),
          showButton: widget.showButton,
          multiSelect: widget.multiSelect,
          detailView: this.widget.detailViewBuilder(index, _isChecked(index)),
          onValueChange: (i, isChecked) {
            _setCheckedItems(i, isChecked);
            widget.checkedItems(widget.checkedItemsList);
          },
        );
      },
    );
  }
}
