import 'package:checkbox_collection/src/checkbox_list_collection/checkbox_list_view_default.dart';
import 'package:flutter/material.dart';

class CheckBoxListCollection extends StatelessWidget {
  final List<String> data;
  final void Function(List<int>) checkedItems;
  final List<int> checkedItemsList = [];

  CheckBoxListCollection(
      {required this.data, required this.checkedItems, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CheckBoxListViewDefault(
          index: index,
          title: data[index],
          onValueChange: (i, isChecked) {
            isChecked ? checkedItemsList.add(i) : checkedItemsList.remove(i);
            checkedItems(checkedItemsList);
          },
        );
      },
    );
  }
}
