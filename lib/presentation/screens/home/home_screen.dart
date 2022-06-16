import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';

import '../shopping_bag/shopping_bag.bloc.dart';
import '../shopping_bag/widgets/wishlist/wish_grid_list.dart';
import 'widgets/banner.dart';
import 'widgets/brands.dart';
import 'widgets/promotions.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.deepOrange, shape: BoxShape.circle),
          child: const Text(
            'YES.',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: -1.2),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'search');
              },
              icon: Icon(
                Icons.search_outlined,
                size: 26,
              )),
          BlocBuilder<WishListBloc, WishListState>(builder: (context, state) {
            return IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  WishGridList.routeName,
                  arguments: {
                    'products': state.wishListItems,
                    'categories': state.categories,
                    'filteredList': state.filteredList,
                  },
                );
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 26,
              ),
            );
          }),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'shopping-bag');
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 26,
                ),
              ),
              BlocBuilder<ShoppingBagBloc, ShoppingBagState>(
                builder: (context, state) {
                  return state.productsSelectedCount > 0
                      ? Positioned(
                          top: 10,
                          right: 6,
                          child: Container(
                            width: 15,
                            height: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Text(
                              '${state.productsCount}',
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                },
              )
            ],
          )
        ],
        bottom: VipCategories(),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey.withOpacity(.05),
            child: Column(
              children: [
                HomeBanner(),
                SizedBox(
                  height: 25,
                ),
                Brands(),
                Promotions()
              ],
            )),
      ),
    );
  }
}
