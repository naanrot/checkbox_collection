import 'package:checkbox_collection/src/checkbox_list_collection/checkbox_list_view_default.dart';
import 'package:flutter/material.dart';

class CheckBoxListCollection extends StatelessWidget {
  final List<String> data;
  final void Function(List<int>) onItemsClicked;
  final List<int> checkedItems = [];

  CheckBoxListCollection(
      {required this.data, required this.onItemsClicked, Key? key})
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
            isChecked ? checkedItems.add(i) : checkedItems.remove(i);
            onItemsClicked(checkedItems);
          },
        );
      },
    );
  }
}
