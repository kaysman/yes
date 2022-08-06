import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-list.dart';
import 'package:yes/presentation/shared/colors.dart';

class SelectSizesSection extends StatefulWidget {
  final ProductEntity product;
  const SelectSizesSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<SelectSizesSection> createState() => _SelectSizesSectionState();
}

class _SelectSizesSectionState extends State<SelectSizesSection> {
  SizeEntity? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      color: kWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Size',
                style: TextStyle(
                  color: kText1Color,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Size chart',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // * sizes here...
          Container(
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                widget.product.sizes?.length ?? 0,
                (index) {
                  return BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      var size = widget.product.sizes?[index];
                      var item = state.toCartItem(widget.product);
                      var hasSizes = context
                          .read<CartBloc>()
                          .checkIfHasItemsSizes(product: widget.product);
                      // print('-----------SIZE---------');
                      // print(hasSizes);
                      // print('-----------SIZE---------');
                      return SizeBox(
                        isSelected: selectedSize == size ||
                            hasSizes?.contains(size) == true,
                        onSelect: (v) {
                          context.read<CartBloc>().addToCart(
                                item,
                                v,
                              );
                          context.read<CartBloc>().addToCartTime(time: 2);
                          setState(() {
                            selectedSize = v;
                          });
                        },
                        size: size!,
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}