import 'package:flutter/material.dart';
import 'widgets/category_list.dart';

class Test {
  final int? id;
  final String? title_tm;
  final String? title_ru;
  final String? subtitle_tm;
  final String? subtitle_ru;
  final String? image;
  final String? background_image;
  final List<Test>? sub;
  bool? isExpanded;

  Test({
    this.id,
    this.title_tm,
    this.title_ru,
    this.subtitle_tm,
    this.subtitle_ru,
    this.image,
    this.background_image,
    this.sub,
    this.isExpanded = false,
  });
}

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final String title = 'Categories';
  List<Test> categorys = [
    Test(
        image: 'assets/child.png',
        background_image: 'assets/ct_bg.jpg',
        sub: [],
        subtitle_tm: 'subtitle',
        title_tm: 'title_tm'),
    Test(
        image: 'assets/child.png',
        background_image: 'assets/ct_bg.jpg',
        sub: [],
        subtitle_tm: 'subtitle',
        title_tm: 'title_tm'),
    Test(
        image: 'assets/child.png',
        background_image: 'assets/ct_bg.jpg',
        sub: [],
        subtitle_tm: 'subtitle',
        title_tm: 'title_tm'),
  ];

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
        category: categorys,
      ),
    );
  }
}
