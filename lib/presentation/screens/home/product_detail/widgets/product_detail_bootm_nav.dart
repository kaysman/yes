import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/cart/cart_screen.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-list.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/button.dart';
import 'package:yes/presentation/shared/helpers.dart';

class ProductDetailBottomNavBar extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailBottomNavBar({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailBottomNavBar> createState() =>
      _ProductDetailBottomNavBarState();
}

class _ProductDetailBottomNavBarState extends State<ProductDetailBottomNavBar> {
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
            child: Button(
              text: 'Halanlarym',
              hasBorder: true,
              primary: kWhite,
              onPressed: () {},
              borderColor: kGrey5Color,
              padding: const EdgeInsets.symmetric(vertical: 14),
              icon: Icon(
                Icons.favorite_border_outlined,
                color: kText1Color,
              ),
            ),
          ),
          //   Container(
          //     decoration: BoxDecoration(
          //         border: Border.all(width: 1.2, color: Colors.grey[200]!),
          //         borderRadius: BorderRadius.circular(3)),
          //     child: BlocBuilder<WishListBloc, WishListState>(
          //         builder: (context, state) {
          //       return TextButton.icon(
          //         onPressed: () {
          //           // context.read<WishListBloc>().addToWishList(product);
          //         },
          //         icon: Icon(
          //           // state.wishListItems.contains(state.toWishListItem(product))
          //           // ? Icons.favorite
          //           Icons.favorite_border_outlined,
          //           size: 18,
          //           color:
          //               // state.wishListItems
          //               // .contains(state.toWishListItem(product))
          //               // ? kPrimaryColor
          //               kText1Color,
          //         ),
          //         label: Text(
          //           'WISHLIST',
          //           style: TextStyle(color: kText1Color, fontSize: 13),
          //         ),
          //       );
          //     }),
          //   ),
          // ),
          SizedBox(
            width: 6,
          ),
          Expanded(
              flex: 5,
              child: BlocConsumer<CartBloc, CartState>(
                listenWhen: (p, c) => p.cartItems != c.cartItems,
                listener: (context, state) {},
                builder: (context, state) {
                  var hasItem = state.cartItems
                      .contains(state.toCartItem(widget.product));

                  return Button(
                    text: hasItem
                        ? 'Sebede git'.toUpperCase()
                        : 'Sebede gos'.toUpperCase(),
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: kWhite,
                    ),
                    hasBorder: true,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    borderColor: kGrey5Color,
                    primary: kPrimaryColor,
                    textColor: kWhite,
                    onPressed: () {
                      if (state.selectedSize == null && !hasItem) {
                        showAppBottomSheet(
                          context,
                          SizeSelectSheet(
                            sizes: widget.product.sizes ?? [],
                          ),
                        );
                      }
                      if (hasItem) {
                        Navigator.pushNamed(context, CartScreen.routeName);
                      } else {
                        context.read<CartBloc>().addToCart(widget.product);
                      }
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}

class SizeSelectSheet extends StatefulWidget {
  final List<SizeEntity> sizes;

  SizeSelectSheet({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  State<SizeSelectSheet> createState() => _SizeSelectSheetState();
}

class _SizeSelectSheetState extends State<SizeSelectSheet> {
  late CartBloc cartBloc;

  SizeEntity? selectedSize;

  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  bool isSelectedSize = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Olcegi:',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          buildSizesBox(context),
          SizedBox(
            height: 14,
          ),
          BlocConsumer<CartBloc, CartState>(
            listenWhen: (p, c) => p.selectedSize != c.selectedSize,
            listener: (context, state) {
              if (state.selectedSize != null) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return Container(
                width: double.infinity,
                child: Button(
                  textColor: kWhite,
                  primary: kPrimaryColor,
                  onPressed: () => {
                    if (selectedSize != null)
                      {cartBloc.toSetSize(selectedSize!)},
                    setState(() {
                      isSelectedSize = selectedSize == state.selectedSize;
                    })
                  },
                  text: 'Yatda sakla',
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  buildSizesBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.sizes
            .map(
              (e) => Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: SizeBox(
                  isSelected: isSelectedSize,
                  onSelect: (v) {
                    setState(() {
                      selectedSize = v;
                    });
                  },
                  size: e,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
