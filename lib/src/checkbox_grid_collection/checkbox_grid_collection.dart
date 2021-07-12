import 'package:checkbox_collection/src/checkbox_collection_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxGridCollection extends StatefulWidget {
  final Widget Function(int, bool) detailViewBuilder;
  final void Function() checkedItems;
  final List<int> checkedItemsList;
  final int itemCount;
  final bool showButton;
  final bool multiSelect;
  final int numberOfColumns;

  const CheckBoxGridCollection({
    required this.detailViewBuilder,
    required this.itemCount,
    required this.checkedItemsList,
    int numberOfColumns = 2,
    bool showButton = false,
    bool multiSelect = true,
    required this.checkedItems,
    Key? key,
  })  : this.showButton = showButton,
        this.multiSelect = multiSelect,
        this.numberOfColumns = numberOfColumns,
        super(key: key);

  @override
  _CheckBoxGridCollectionState createState() => _CheckBoxGridCollectionState();
}

class _CheckBoxGridCollectionState extends State<CheckBoxGridCollection> {
  @override
  Widget build(BuildContext context) {
    final maxCrossAxisExtent = MediaQuery.of(context).size.width / widget.numberOfColumns;
    bool _isChecked(index) => widget.checkedItemsList.contains(index) ? true : false;

    void _setCheckedItems(i, isChecked) {
      if (widget.multiSelect) {
        isChecked ? widget.checkedItemsList.add(i) : widget.checkedItemsList.remove(i);
      } else {
        widget.checkedItemsList.clear();
        widget.checkedItemsList.add(i);
      }
    }

    return GridView.builder(
      itemCount: widget.itemCount,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
      ),
      itemBuilder: (context, index) {
        return CheckBoxDefaultView(
          index: index,
          showButton: widget.showButton,
          multiSelect: widget.multiSelect,
          isChecked: _isChecked(index),
          detailView: this.widget.detailViewBuilder(index, _isChecked(index)),
          onValueChange: (i, isChecked) {
            _setCheckedItems(i, isChecked);
            widget.checkedItems();
          },
        );
      },
    );
  }
}
