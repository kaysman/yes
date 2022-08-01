import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/helpers.dart';
import '../shopping_bag.bloc.dart';
import '../shopping_bag_screen.dart';
import 'custom_check_box.dart';

class ProductDetailList extends StatefulWidget {
  ProductDetailList({Key? key}) : super(key: key);

  @override
  State<ProductDetailList> createState() => _ProductDetailListState();
}

class _ProductDetailListState extends State<ProductDetailList> {
  @override
  Widget build(BuildContext context) {
    int counter = 1;

    var products = [
      CartItem(
        price: Faker().randomGenerator.integer(200),
        image: 'assets/trend.png',
        description_tm: Faker().job.title(),
        code: Faker().internet.random.toString(),
        id: Faker().randomGenerator.integer(100),
      ),
    ];
    return products == []
        ? Center(child: Text('EMPTY'))
        : Column(
            children: List.generate(
              products.length,
              (index) => _ProductDetail(
                onChangeQauntity: () {
                  showAppBottomSheet(
                    context,
                    CartModalSheet(onDone: (v) {
                      setState(() {
                        counter = v;
                      });
                    }),
                  );
                  // showModalBottomSheet(
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   isScrollControlled: true,
                  //   shape: kShape,
                  //   context: context,
                  //   builder: (contex) {
                  //     return BlocConsumer<ShoppingBagBloc, ShoppingBagState>(
                  //       listener: (_, state) {
                  //         if (state.isPriceUpdated) {
                  //           Navigator.of(context).pop();
                  //         }
                  //       },
                  //       builder: (context, state) {
                  //         return CartModalSheet(
                  //           onDone: (val) {
                  //             context
                  //                 .read<ShoppingBagBloc>()
                  //                 .changeProductQuantity(
                  //                   products[index],
                  //                   val,
                  //                 );
                  //           },
                  //           quantity: products[index].quantity!,
                  //         );
                  //       },
                  //     );
                  //   },
                  // );
                },
                // price: products[index].totalPrice ?? products[index].price,
                price: counter,
                quantityVal: products[index].defQuantity,
                onDelete: () {
                  context.read<ShoppingBagBloc>().remove(products[index]);
                },
                onTap: (v) {
                  context
                      .read<ShoppingBagBloc>()
                      .selectProduct(products[index], v);
                },
                productName: products[index].name_tm ?? '',
                productCode: products[index].description_tm ?? '',
                image: products[index].image ?? '',
                isSelected: products[index].isSelected,
              ),
            ),
          );
  }
}

class CartModalSheet extends StatefulWidget {
  // int quantity;
  final ValueSetter<int> onDone;
  CartModalSheet({
    Key? key,
    required this.onDone,
    // required this.quantity,
    // required this.onDone,
  }) : super(key: key);

  @override
  State<CartModalSheet> createState() => _CartModalSheetState();
}

class _CartModalSheetState extends State<CartModalSheet> {
  List<Map<String, dynamic>> q = [];
  int val = 0;
  int counter = 0;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    // quantities();
  }

  // List<Map<String, dynamic>> quantities() {
  //   for (var i = 1; i <= widget.quantity; i++) {
  //     setState(() {
  //       q.add({'val': i, 'isSelected': false});
  //     });
  //   }
  //   return q;
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.quantity);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 150,
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
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
            // ListView.builder(
            //   itemCount: q.length,
            //   padding: EdgeInsets.zero,
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (_, i) {
            //     return Column(
            //       children: [

            //         // InkWell(
            //         //   onTap: () {
            //         //     // setState(() {
            //         //     //   val = (i + 1);
            //         //     //   for (var i in q) {
            //         //     //     i['isSelected'] = false;
            //         //     //   }
            //         //     //   q[i]['isSelected'] = true;
            //         //     // });
            //         //   },
            //         //   child: Container(
            //         //     height: 50,
            //         //     width: 50,
            //         //     decoration: BoxDecoration(
            //         //         border: Border.all(
            //         //             color: q[i]['isSelected']
            //         //                 ? kPrimaryColor
            //         //                 : kText1Color,
            //         //             width: 1),
            //         //         borderRadius: BorderRadius.circular(50)),
            //         //     alignment: Alignment.center,
            //         //     margin: const EdgeInsets.only(right: 10),
            //         //     child: Text(
            //         //       '${i + 1}',
            //         //       style: Theme.of(context)
            //         //           .textTheme
            //         //           .bodyMedium
            //         //           ?.copyWith(color: kText1Color),
            //         //     ),
            //         //   ),
            //         // ),
            //       ],
            //     );
            //   },
            // ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => widget.onDone.call(counter),
              child: Text('Done'),
            ),
          )),
        ],
      ),
    );
  }

  buildCounterBtn(String sign, bool isIncrement, BuildContext ctx) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kWhite,
      ),
      onPressed: () {
        setState(() {
          if (isIncrement) {
            counter++;
          } else {
            if (counter > 0) {
              counter--;
            }
          }
        });
      },
      child: Text(
        sign,
        style: Theme.of(ctx).textTheme.bodyText1,
      ),
    );
  }
}

class _ProductDetail extends StatelessWidget {
  final String productName;
  final bool? isSelected;
  final String productCode;
  final String image;
  final ValueChanged<bool> onTap;
  final Function() onDelete;
  final Function() onChangeQauntity;
  final int? quantityVal;
  final int? price;

  const _ProductDetail({
    Key? key,
    required this.productName,
    required this.productCode,
    required this.image,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
    required this.onChangeQauntity,
    required this.quantityVal,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   image,
                //   fit: BoxFit.cover,
                // ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 4),
                          color: Colors.grey[100],
                          child: Row(
                            children: [
                              Text(
                                'Size: XXL ',
                                style: TextStyleUtils().boldText,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 12,
                                color: kText1Color,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: onChangeQauntity,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 4),
                            color: Colors.grey[100],
                            child: Row(
                              children: [
                                Text(
                                  'Qty: $quantityVal',
                                  style: TextStyleUtils().boldText,
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 12,
                                  color: kText1Color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ProductDiscountPrice(),
                    Text.rich(
                      TextSpan(
                        text: '$price',
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
      Positioned(
        top: 15,
        left: 15,
        child: CustomCheckBox(
          isChecked: isSelected ?? false,
          onTapped: onTap,
          color: Colors.grey[200],
        ),
      ),
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
    ]);
  }
}
