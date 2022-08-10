import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
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
  late CartBloc cartBloc;

  SizeEntity? selectedSize;

  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

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
          SizedBox(
            width: 6,
          ),
          Expanded(
            flex: 5,
            child: BlocConsumer<CartBloc, CartState>(
              listenWhen: (p, c) =>
                  p.cartItems != c.cartItems ||
                  p.addToCartTime != c.addToCartTime,
              listener: (context, state) {},
              builder: (context, state) {
                var hasItem = cartBloc.checkIfHasItem(product: widget.product);
                var hasSizes =
                    cartBloc.checkIfHasItemsSizes(product: widget.product);
                var item = state.toCartItem(widget.product);
                return Button(
                  text: hasItem == true
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
                  onPressed: () async {
                    context.read<CartBloc>().addToCartTime();

                    if (state.isOrdered && state.cartItems.isEmpty) {
                      alreadyOrderedSheet(context);
                    } else if (hasItem == false ||
                        (hasSizes?.length ?? 0) < (item.sizes?.length ?? 0) &&
                            state.addToCartTime.isOdd) {
                      await showAppBottomSheet(
                        context,
                        SizeSelectSheet(
                          hasSizes: hasSizes,
                          sizes: widget.product.sizes,
                          item: item,
                        ),
                      );
                    } else if (hasItem == true && state.addToCartTime.isEven ||
                        (hasSizes?.length ?? 0) == (item.sizes?.length ?? 0)) {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SizeSelectSheet extends StatefulWidget {
  final List<SizeEntity>? sizes;
  final List<SizeEntity>? hasSizes;
  final CartItem item;
  SizeSelectSheet({
    Key? key,
    required this.sizes,
    required this.item,
    this.hasSizes,
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
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
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
              buildSizesBox(context, state),
              SizedBox(
                height: 14,
              ),
              Container(
                width: double.infinity,
                child: Button(
                  textColor: kWhite,
                  primary: kPrimaryColor,
                  onPressed: () => {
                    if (selectedSize != null)
                      {
                        context
                            .read<CartBloc>()
                            .addToCart(widget.item, selectedSize!),
                      },
                    if (state.cartItems.contains(widget.item))
                      {
                        Navigator.of(context).pop(),
                      }
                  },
                  text: 'Yatda sakla',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  buildSizesBox(BuildContext context, CartState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          widget.sizes?.length ?? 0,
          (index) {
            var size = widget.sizes?[index];
            // var hasSize =
            //     context.read<CartBloc>().checkIfHasSize(widget.item, size);

            return Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              child: SizeBox(
                isHas: widget.hasSizes?.contains(size) == true,
                isSelected: size == selectedSize,
                onSelect: (v) {
                  setState(() {
                    selectedSize = v;
                  });
                },
                size: size!,
              ),
            );
          },
        ),
      ),
    );
  }
}


