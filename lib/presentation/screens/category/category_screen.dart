import 'package:flutter/material.dart';
import 'widgets/category_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  final String title = 'Categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: CategoryList(
        categories: [],
      ),
    );
  }
}
