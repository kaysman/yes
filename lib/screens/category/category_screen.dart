import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yes_demo/helpers/colors.dart';
import '../../global_providers/category_provider.dart';
import 'widgets/category_list.dart';



class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  final String title = 'Categories';
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: categoryData.isLoading
          ? Center(
              child: SpinKitDoubleBounce(color: primaryColor),
            )
          : CategoryList(categories: categoryData.categories),
    );
  }
}
