import 'package:checkbox_collection/src/widget/checkbox_list_view.dart';
import 'package:flutter/material.dart';

class CheckBoxListCollection extends StatelessWidget {
  final List<String> data;
  const CheckBoxListCollection({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckBoxListView(
      data: data,
    );
  }
}
