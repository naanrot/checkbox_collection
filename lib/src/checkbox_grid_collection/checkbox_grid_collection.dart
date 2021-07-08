import 'package:checkbox_collection/src/checkbox_collection_item_view.dart';
import 'package:flutter/material.dart';

class CheckBoxGridCollection extends StatelessWidget {
  final Widget Function(int) detailViewBuilder;
  final void Function(List<int>) checkedItems;
  static final List<int> _checkedItemsList = [];
  final int itemCount;
  final bool showCheckBox;

  const CheckBoxGridCollection({
    required this.detailViewBuilder,
    bool showCheckBox = false,
    required this.itemCount,
    required this.checkedItems,
    Key? key,
  })  : this.showCheckBox = showCheckBox,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
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
