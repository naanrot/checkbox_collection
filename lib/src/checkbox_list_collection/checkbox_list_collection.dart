import 'package:checkbox_collection/src/checkbox_list_collection/checkbox_list_view_default.dart';
import 'package:flutter/material.dart';

class CheckBoxListCollection extends StatelessWidget {
  final Widget Function(int) detailViewBuilder;
  final void Function(List<int>) checkedItems;
  final List<int> _checkedItemsList = [];
  final int itemCount;

  CheckBoxListCollection(
      {required this.detailViewBuilder, required this.itemCount,required this.checkedItems, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.itemCount,
      itemBuilder: (context, index) {
        return CheckBoxListViewDefault(
          index: index,
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
