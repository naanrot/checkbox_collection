import 'package:checkbox_collection/src/widget/checkbox_list_view_default.dart';
import 'package:flutter/material.dart';

class CheckBoxListView extends StatefulWidget {
  final List<String> data;
  const CheckBoxListView({required this.data, Key? key}) : super(key: key);

  @override
  _CheckBoxListViewState createState() => _CheckBoxListViewState();
}

class _CheckBoxListViewState extends State<CheckBoxListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return CheckBoxListViewDefault(
          title: widget.data[index],
        );
      },
    );
  }
}