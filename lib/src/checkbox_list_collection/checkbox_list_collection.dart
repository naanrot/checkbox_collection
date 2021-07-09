import 'package:flutter/material.dart';

import '../checkbox_collection_item_view.dart';

class CheckBoxListCollection extends StatelessWidget {
  final Widget Function(int) detailViewBuilder;
  final void Function(List<int>) checkedItems;
  static final List<int> _checkedItemsList = [];
  final int itemCount;
  final bool showCheckBox;

  const CheckBoxListCollection({
    required this.detailViewBuilder,
    bool showCheckBox = true,
    required this.itemCount,
    required this.checkedItems,
    Key? key,
  })  : this.showCheckBox = showCheckBox,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.itemCount,
      itemBuilder: (context, index) {
        return CheckBoxDefaultView(
          index: index,
          showCheckBox: showCheckBox,
          detailView: this.detailViewBuilder(index),
          onValueChange: (i, isChecked) {
            isChecked ? _checkedItemsList.add(i) : _checkedItemsList.remove(i);
            checkedItems(_checkedItemsList);
          },
        );
      },
    );
  }
}
