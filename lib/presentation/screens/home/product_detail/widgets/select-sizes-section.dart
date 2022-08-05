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
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (p, c) => p.selectedCartItem != c.selectedCartItem,
      listener: (context, state) {},
      builder: (context, state) {
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
                      var size = widget.product.sizes?[index];
                      return SizeBox(
                        isSelected: selectedSize == size,
                        onSelect: (v) {
                          var item = state.toCartItem(widget.product);
                          // item.selectedSize = v;
                          context.read<CartBloc>().addToCart(item);
                          setState(() {
                            selectedSize = v;
                          });
                        },
                        size: size!,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
