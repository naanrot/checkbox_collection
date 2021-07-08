import 'package:checkbox_collection/src/checkbox_list_collection/checkbox_list_view_default.dart';
import 'package:flutter/material.dart';

class CheckBoxListCollection extends StatefulWidget {
  final List<String> data;
  final void Function(List<int>)? onItemsClicked;

  const CheckBoxListCollection(
      {required this.data, Function(List<int>)? onItemClicked, Key? key})
      : this.onItemsClicked = onItemClicked,
        super(key: key);

  @override
  _CheckBoxListCollectionState createState() => _CheckBoxListCollectionState();
}

class _CheckBoxListCollectionState extends State<CheckBoxListCollection> {
  final List<int> checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return CheckBoxListViewDefault(
          index: index,
          title: widget.data[index],
          onValueChange: (i, isChecked) {
            isChecked ? checkedItems.add(i) : checkedItems.remove(i);

            if (widget.onItemsClicked != null) {
              widget.onItemsClicked!(checkedItems);
            }
          },
        );
      },
    );
  }
}
