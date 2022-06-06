import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/category/category.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'widgets/category_list.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
      body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return state.tabStatus == TabCategoryFetchingStatus.Loading
                ? Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                : CategoryList(
                    category: state.tabCategories,
                  );
          }),
    );
  }
}
