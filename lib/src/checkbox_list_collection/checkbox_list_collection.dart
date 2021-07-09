import 'package:flutter/material.dart';

import '../checkbox_collection_item_view.dart';

class CheckBoxListCollection extends StatelessWidget {
  final Widget Function(int) detailViewBuilder;
  final void Function() checkedItems;
  final List<int> checkedItemsList;
  final int itemCount;
  final bool showCheckBox;

  CheckBoxListCollection({
    required this.detailViewBuilder,
    bool showCheckBox = true,
    required this.checkedItemsList,
    required this.itemCount,
    required this.checkedItems,
    Key? key,
  })  :this.showCheckBox = showCheckBox,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.itemCount,
      itemBuilder: (context, index) {
        return CheckBoxDefaultView(
          index: index,
          isChecked: checkedItemsList.contains(index) ? true : false,
          showCheckBox: showCheckBox,
          detailView: this.detailViewBuilder(index),
          onValueChange: (i, isChecked) {
            isChecked ? checkedItemsList.add(i) : checkedItemsList.remove(i);
            checkedItems();
          },
        );
      },
    );
  }
}
