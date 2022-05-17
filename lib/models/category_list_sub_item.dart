import 'package:flutter/cupertino.dart';

class CategoryListSubItemModel {
  final List<String>? subChildCategories;
  final String title;
  bool isExpanded;

  CategoryListSubItemModel(
      {required this.title, this.subChildCategories, this.isExpanded = false});
}
