import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/category/category.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/app-loading-bar.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
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
        title: AppBarTitle(title: title),
        actions: [
          FavoriteButton(),
          CartButton(),
        ],
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state.listingStatus == CategoryListStatus.loading) {
          return AppLoadingBar();
        }

        if (state.listingStatus == CategoryListStatus.error) {
          return AppErrorWidget(onTryAgain: () {
            context.read<CategoryBloc>().getAllCategories();
          });
        }

        return CategoryList(
          category: state.categories,
        );
      }),
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({Key? key, required this.onTryAgain}) : super(key: key);
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/error.png'),
          Button(
            text: 'Gaytadan synanysyn',
            textColor: kWhite,
            primary: kPrimaryColor,
            icon: Icon(
              CupertinoIcons.refresh,
              color: kWhite,
            ),
            onPressed: onTryAgain,
          ),
        ],
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.bodyText2?.copyWith(color: kGrey1Color),
    );
  }
}
