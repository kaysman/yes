import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/screens/shopping_bag/shopping_bag.bloc.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/apply_cupon.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/cart_bottom_nav.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/item_select_bar.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/my_container.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/offers.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/product_details.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/user_adress.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/whish_bottom_sheet.dart';
import 'package:yes/presentation/shared/colors.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "shopping-bag";
  // final List<Product>? products;
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Client? currentUser;
  late ShoppingBagBloc shoppingBagBloc;

  @override
  void initState() {
    super.initState();
    currentUser = AppService.currentUser.value;
    shoppingBagBloc = BlocProvider.of<ShoppingBagBloc>(context);
    // shoppingBagBloc.updateProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              showWhishListSheet(context);
            },
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 20,
            )),
      ], elevation: 0.6, title: Text('Shopping bag')),
      body: Container(
        color: Colors.grey[100],
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: kWhite,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                child: Text(
                  '${currentUser?.address}',
                  style: TextStyle(
                      color: kText1Color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              UserAdress(user: currentUser),
              SizedBox(
                height: 8,
              ),
              Offers(),
              SizedBox(
                child: ItemSelectBar(),
              ),
              ProductDetailList(),
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
                            txtColor: kText1Color,
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
                            txtColor: kPrimaryColor,
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
                                            color: kPrimaryColor,
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
                        txtColor: kText1Color)
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
      color: kText1Color, fontWeight: FontWeight.w500, fontSize: 12);
  TextStyle smallboldText = const TextStyle(
      color: kText1Color, fontWeight: FontWeight.w500, fontSize: 11);
  TextStyle thinText = const TextStyle(color: kText1Color, fontSize: 12);
  TextStyle smallthinText = const TextStyle(color: kText1Color, fontSize: 11);
}
