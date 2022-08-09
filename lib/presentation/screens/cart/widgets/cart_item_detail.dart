import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-list.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/button.dart';
import 'package:yes/presentation/shared/helpers.dart';
import '../cart_screen.dart';

class ProductDetailList extends StatefulWidget {
  ProductDetailList({Key? key}) : super(key: key);

  @override
  State<ProductDetailList> createState() => _ProductDetailListState();
}

class _ProductDetailListState extends State<ProductDetailList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        var products = state.cartItems;
        return Column(
          children: List.generate(products.length, (index) {
            var item = products[index];
            return _ProductDetail(
              onTap: (v) {},
              sizes: [],
              selectedSize: item.selectedSize,
              onChangeSizeAndCount: () {
                showAppBottomSheet(
                  context,
                  CartModalSheet(
                    item: item,
                  ),
                );
              },
              price: item.price,
              quantityVal: item.defQuantity,
              onDelete: () {
                context.read<CartBloc>().remove(products[index]);
              },
              productName: item.name_tm ?? '',
              productCode: item.description_tm ?? '',
              image: item.image ?? '',
              isSelected: item.isSelected,
            );
          }),
        );
      },
    );
  }
}

class CartModalSheet extends StatefulWidget {
  final CartItem item;

  CartModalSheet({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CartModalSheet> createState() => _CartModalSheetState();
}

class _CartModalSheetState extends State<CartModalSheet> {
  int counter = 0;
  late CartBloc cartBloc;
  SizeEntity? selectedSize;
  @override
  void initState() {
    super.initState();

    cartBloc = BlocProvider.of<CartBloc>(context);
    counter = widget.item.defQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var hasSizes = cartBloc.checkIfHasItemsSizes(cartItem: widget.item);

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
              buildSizesBox(hasSizes),
              Text(
                'Sany:',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                children: [
                  buildCounterBtn('+', true, context),
                  SizedBox(
                    width: 20,
                  ),
                  Text('${counter}'),
                  SizedBox(
                    width: 20,
                  ),
                  buildCounterBtn('-', false, context),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: double.infinity,
                child: Button(
                  textColor: kWhite,
                  primary: kPrimaryColor,
                  onPressed: () => {
                    cartBloc.updateItemCountAndSize(
                      widget.item,
                      widget.item.price == counter ? null : counter,
                      widget.item.selectedSize == selectedSize
                          ? null
                          : selectedSize,
                    ),
                    Navigator.of(context).pop(),
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

  buildSizesBox(List<SizeEntity>? hasSizes) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.item.sizes?.length ?? 0, (index) {
          var size = widget.item.sizes?[index];
          return Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: SizeBox(
              isHas: hasSizes?.contains(size) == true,
              isSelected: size == selectedSize,
              onSelect: (v) {
                setState(() {
                  selectedSize = v;
                });
              },
              size: size!,
            ),
          );
        }),
      ),
    );
  }

  buildCounterBtn(String sign, bool isIncrement, BuildContext ctx) {
    return Button(
      primary: Colors.black45,
      textColor: kWhite,
      onPressed: () {
        setState(
          () {
            if (isIncrement) {
              counter++;
            } else {
              if (counter > 0) {
                counter--;
              }
            }
          },
        );
      },
      text: sign,
    );
  }
}

class _ProductDetail extends StatelessWidget {
  final String productName;
  final bool? isSelected;
  final String productCode;
  final String image;
  final ValueChanged<bool> onTap;
  final VoidCallback onDelete;
  final VoidCallback onChangeSizeAndCount;
  final int? quantityVal;
  final int? price;
  final List<SizeEntity> sizes;
  final SizeEntity? selectedSize;

  const _ProductDetail({
    Key? key,
    required this.productName,
    required this.productCode,
    required this.image,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
    required this.quantityVal,
    required this.price,
    required this.sizes,
    required this.onChangeSizeAndCount,
    required this.selectedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kWhite,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 150,
                  child: Image.network(
                    image,
                    cacheWidth: MediaQuery.of(context).size.width.toInt(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyleUtils().boldText,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        productCode,
                        style: TextStyleUtils().thinText,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sold by: Gopala Srees',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: buildSizeAndQuantity(
                              context,
                              size: selectedSize,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            flex: 3,
                            child: buildSizeAndQuantity(
                              context,
                              count: quantityVal,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // ProductDiscountPrice(),
                      Text.rich(
                        TextSpan(
                          text: '$price TMT',
                          style: TextStyle(
                            color: kText1Color,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.check, size: 15, color: Colors.green),
                            SizedBox(
                              width: 5,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Delivery by',
                                style: TextStyleUtils().smallthinText,
                                children: [
                                  TextSpan(
                                    text: '23 May 2022',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: 15,
        //   left: 15,
        //   child: CustomCheckBox(
        //     isChecked: isSelected ?? false,
        //     onTapped: onTap,
        //     color: Colors.grey[200],
        //   ),
        // ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              Icons.close,
              size: 20,
              color: kText1Color,
            ),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }

  buildSizeAndQuantity(BuildContext context, {SizeEntity? size, int? count}) {
    return InkWell(
      onTap: onChangeSizeAndCount,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        color: Colors.grey[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              size != null ? 'Olcegi: ${size.name_tm}' : 'Sany: ${count}',
              style: TextStyleUtils().boldText,
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 12,
              color: kText1Color,
            )
          ],
        ),
      ),
    );
  }
}
