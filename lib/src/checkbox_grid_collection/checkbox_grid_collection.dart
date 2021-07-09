import 'package:checkbox_collection/src/checkbox_collection_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxGridCollection extends StatelessWidget {
  final Widget Function(int, bool) detailViewBuilder;
  final void Function() checkedItems;
  final List<int> checkedItemsList;
  final int itemCount;
  final bool multiSelect;
  final int numberOfColumns;

  const CheckBoxGridCollection({
    required this.detailViewBuilder,
    required this.itemCount,
    required this.checkedItemsList,
    int numberOfColumns = 2,
    bool multiSelect = false,
    required this.checkedItems,
    Key? key,
  })  : this.multiSelect = multiSelect,
        this.numberOfColumns = numberOfColumns,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxCrossAxisExtent = MediaQuery.of(context).size.width / numberOfColumns;
    bool _isChecked(index) => checkedItemsList.contains(index) ? true : false;

    void _setCheckedItems(i, isChecked) {
      if (multiSelect) {
        isChecked ? checkedItemsList.add(i) : checkedItemsList.remove(i);
      } else {
        checkedItemsList.clear();
        checkedItemsList.add(i);
      }
    }

    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
      ),
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
