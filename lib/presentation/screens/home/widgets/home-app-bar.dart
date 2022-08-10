import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';
import 'package:yes/presentation/screens/home/search/widgets/search-input.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/icons.dart';

import '../../cart/widgets/wishlist/wish_grid_list.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key, this.title, this.isList, this.onSearch})
      : super(key: key);
  final String? title;
  final bool? isList;
  final ValueChanged<String>? onSearch;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 56);
}

class _HomeAppBarState extends State<HomeAppBar> {
  TextEditingController searchTextController = TextEditingController();
  String? onSearchChangedText;
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      leadingWidth: 30,
      title: widget.title == null
          ? Logo()
          : isSearch
              ? SearchInput(
                  serchTextController: searchTextController,
                  onSearchChanged: (v) {
                    setState(() {
                      onSearchChangedText = v;
                    });
                  },
                  onSearch: () =>
                      widget.onSearch?.call(onSearchChangedText ?? ''),
                  onChangedTextIsNotEmty:
                      onSearchChangedText?.isNotEmpty == true,
                )
              : Text(widget.title ?? '-'),
      actions: isSearch
          ? []
          : [
              widget.isList == null
                  ? buildSearchBtn(context)
                  : buildSearchBtn(context, isList: true),
              BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
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
                  icon: Icon(Icons.favorite_border),
                );
              }),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'shopping-bag');
                    },
                    icon: Image.asset(
                      AppIcons.bag,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.cartItems.length > 0
                          ? Positioned(
                              top: 10,
                              right: 6,
                              child: ProductCountIndicator(
                                state: state,
                              ),
                            )
                          : SizedBox.shrink();
                    },
                  )
                ],
              )
            ],
    );
  }

  buildSearchBtn(BuildContext context, {bool? isList}) {
    return IconButton(
      onPressed: () {
        if (isList != null) {
          setState(() {
            isSearch = true;
          });
        } else {
          Navigator.pushNamed(context, 'search');
        }
      },
      icon: AppIcons.svgAsset(
        AppIcons.search,
        color: kText1Color,
      ),
    );
  }
}
