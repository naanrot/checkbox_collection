import 'package:flutter/material.dart';

import '../checkbox_collection_item_view.dart';

class CheckBoxListCollection extends StatelessWidget {
  final Widget Function(int, bool) detailViewBuilder;
  final void Function() checkedItems;
  final List<int> checkedItemsList;
  final int itemCount;
  final bool multiSelect;

  const CheckBoxListCollection({
    required this.detailViewBuilder,
    required this.checkedItemsList,
    required this.itemCount,
    bool multiSelect = true,
    required this.checkedItems,
    Key? key,
  })  :this.multiSelect = multiSelect,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isChecked(index) => checkedItemsList.contains(index) ? true : false;

    void _setCheckedItems(i, isChecked) {
      if (multiSelect) {
        isChecked ? checkedItemsList.add(i) : checkedItemsList.remove(i);
      } else {
        checkedItemsList.clear();
        checkedItemsList.add(i);
      }
    }

    return ListView.builder(
      itemCount: this.itemCount,
      itemBuilder: (context, index) {
        return CheckBoxDefaultView(
          index: index,
          isChecked: _isChecked(index),
          detailView: this.detailViewBuilder(index, _isChecked(index)),
          onValueChange: (i, isChecked) {
            _setCheckedItems(i, isChecked);
            checkedItems();
          },
        );
      },
    );
  }
}
