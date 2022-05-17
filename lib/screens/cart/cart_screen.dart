import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/models/product_model.dart';
import 'package:yes_demo/screens/cart/widgets/my_container.dart';
import 'package:yes_demo/widgets/product_discount_price.dart';
import 'widgets/apply_cupon.dart';
import 'widgets/cart_bottom_nav.dart';
import 'widgets/custom_check_box.dart';
import 'widgets/item_select_bar.dart';
import 'widgets/offers.dart';
import 'widgets/product_details.dart';
import 'widgets/show_more_btn.dart';
import 'widgets/un_order_list_text.dart';
import 'widgets/user_adress.dart';
import 'widgets/whish_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  // * Database u have
  List<ProductsModel> products = [
    ProductsModel(
      isNew: false,
      commentCount: 2,
      rating: 2.3,
      productName: 'Peter England Casuals',
      productCode: 'Men Slim Fit Jogger Jeans',
      productPrice: 1.099,
      imagePath: 'assets/trenM.jpg',
      oldPrice: 380,
      discount: 20,
    ),
    ProductsModel(
        isNew: true,
        productName: 'Peter England Casuals',
        rating: 3.7,
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/my.jpg',
        oldPrice: 250,
        discount: 18),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showWhishListSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.favorite_border_outlined,
                size: 20,
                color: text1Color,
              ),
            ),
          )
        ],
        elevation: 0.6,
        backgroundColor: whiteColor,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            size: 18,
            color: text1Color,
          ),
        ),
        title: Container(
          child: Text(
            "SHOPPING BAG",
            style: TextStyleUtils().boldText,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                child: Text(
                  'Time Line...',
                  style: TextStyle(
                      color: text1Color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              UserAdress(),
              SizedBox(
                height: 8,
              ),
              Offers(),
              SizedBox(
                child: ItemSelectBar(),
              ),
              ProductDetailList(
                products: products,
              ),
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    'COUPONS',
                    style: TextStyleUtils().smallboldText,
                  ),
                ),
              ),
              ApplyCupon(),
              SizedBox(
                height: 10,
              ),
              MyContainer(
                pVertical: 15,
                pHorizontal: 12,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'PRICE DETAILS (1 Item)',
                        style: TextStyleUtils().smallboldText,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black26,
                      height: .6,
                      thickness: .2,
                    ),
                    MyContainer(
                      pVertical: 12,
                      pHorizontal: 0,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _PriceRowText(
                            txtColor: text1Color,
                            price: '1.499',
                            text: 'Total MRP',
                          ),
                          _PriceRowText(
                            text: 'Discount on MRP',
                            txtColor: Colors.green,
                            price: '-750TMT',
                          ),
                          _PriceRowText(
                            text: 'Coupon Discount',
                            price: 'Apply Coupon',
                            txtColor: primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Convenience Fee   ',
                                  style: TextStyleUtils().thinText,
                                  children: [
                                    TextSpan(
                                        text: 'Know More',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                              Text(
                                '99TMT',
                                style: TextStyleUtils().smallthinText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                      height: .6,
                      thickness: .2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _PriceRowText(
                        text: 'Total Amount',
                        price: '848TMT',
                        fontWeight: FontWeight.w500,
                        txtColor: text1Color)
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ProductGurrantee(
                            icon: Icons.generating_tokens_outlined,
                            title: 'Geniune Products'),
                      ),
                      Dot(),
                      Expanded(
                        flex: 3,
                        child: ProductGurrantee(
                          icon: Icons.connect_without_contact_sharp,
                          title: 'Contactless Delivery',
                        ),
                      ),
                      Dot(),
                      Expanded(
                        flex: 3,
                        child: ProductGurrantee(
                            icon: Icons.security_sharp,
                            title: 'Secure Payments'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CartBottomNav(),
    );
  }

  void showWhishListSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return WhishBottomSheet();
      },
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
    );
  }
}

class ProductGurrantee extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProductGurrantee({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.black26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: TextStyle(color: Colors.black26, fontSize: 9),
            ),
          )
        ],
      ),
    );
  }
}

class _PriceRowText extends StatelessWidget {
  final String text;
  final String price;
  final Color txtColor;
  final FontWeight? fontWeight;
  const _PriceRowText({
    Key? key,
    required this.text,
    required this.price,
    required this.txtColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyleUtils().smallthinText,
          ),
          Text(
            "$price",
            style: TextStyle(
                color: txtColor, fontSize: 11, fontWeight: fontWeight),
          )
        ],
      ),
    );
  }
}

class TextStyleUtils {
  TextStyle boldText = const TextStyle(
      color: text1Color, fontWeight: FontWeight.w500, fontSize: 12);
  TextStyle smallboldText = const TextStyle(
      color: text1Color, fontWeight: FontWeight.w500, fontSize: 11);
  TextStyle thinText = const TextStyle(color: text1Color, fontSize: 12);
  TextStyle smallthinText = const TextStyle(color: text1Color, fontSize: 11);
}
