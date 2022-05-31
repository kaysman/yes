import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../../../../data/models/product_model.dart';
import '../shopping_bag_screen.dart';
import 'custom_check_box.dart';
import 'product_discount_price.dart';

class ProductDetailList extends StatelessWidget {
  final List<ProductsModel> products;
  ProductDetailList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: products
            .map(
              (e) => _ProductDetail(
                productCode: e.productCode,
                productName: e.productName,
              ),
            )
            .toList());
  }
}

class _ProductDetail extends StatelessWidget {
  final String productName;
  final String productCode;
  const _ProductDetail({
    Key? key,
    required this.productName,
    required this.productCode,
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
                  'assets/banner.jpg',
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 4),
                          color: Colors.grey[100],
                          child: Row(
                            children: [
                              Text(
                                'Qty: 4 ',
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProductDiscountPrice(),
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
                              text: 'Delivery by ',
                              style: TextStyleUtils().smallthinText,
                              children: [
                                TextSpan(
                                    text: '23 May 2022',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500))
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
            onPressed: () {
              print('object');
            },
          ))
    ]);
  }
}
