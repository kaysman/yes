import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../cart_screen.dart';
import 'custom_check_box.dart';

class ItemSelectBar extends StatefulWidget {
  const ItemSelectBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemSelectBar> createState() => _ItemSelectBarState();
}

class _ItemSelectBarState extends State<ItemSelectBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCheckBox(
                      isChecked: state.cartItems.length > 0,
                      onTapped: (v) {
                        // context
                        //     .read<ShoppingBagBloc>()
                        //     .selectOrUnSelectAllproducts(v);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '${state.productsCount} sany haryt sayladynyz',
                        style: TextStyleUtils().boldText,
                        children: [
                          TextSpan(
                            text: ' (${state.totalPrice} TMT)',
                            style: TextStyle(color: kPrimaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: kText1Color,
                      size: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.favorite_outline_rounded,
                      color: kText1Color,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    );
  }
}
