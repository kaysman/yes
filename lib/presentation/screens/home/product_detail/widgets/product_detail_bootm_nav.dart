import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/presentation/screens/shopping_bag/shopping_bag.bloc.dart';
import 'package:yes/presentation/screens/shopping_bag/shopping_bag_screen.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProductDetailBottomNavBar extends StatelessWidget {
  final Product product;
  const ProductDetailBottomNavBar({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.2, color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(3)),
              child: BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                return TextButton.icon(
                  onPressed: () {
                    context.read<WishListBloc>().addToWishList(product);
                  },
                  icon: Icon(
                    state.wishListItems.contains(state.toWishListItem(product))
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 18,
                    color: state.wishListItems
                            .contains(state.toWishListItem(product))
                        ? kPrimaryColor
                        : kText1Color,
                  ),
                  label: Text(
                    'WISHLIST',
                    style: TextStyle(color: kText1Color, fontSize: 13),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: BlocBuilder<ShoppingBagBloc, ShoppingBagState>(
                builder: (context, state) {
                  return TextButton.icon(
                    onPressed: () {
                      if (state.cartItems.contains(
                        state.toCartItem(product),
                      )) {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      } else {
                        context.read<ShoppingBagBloc>().addToCart(product);
                      }
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18,
                      color: kWhite,
                    ),
                    label: state.cartItems.contains(state.toCartItem(product))
                        ? Text(
                            'Go TO BAG',
                            style: TextStyle(color: kWhite, fontSize: 13),
                          )
                        : Text(
                            'ADD TO BAG',
                            style: TextStyle(color: kWhite, fontSize: 13),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
