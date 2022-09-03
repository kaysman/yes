import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/data/models/order/order-product.model.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/screens/cart/blocs/order.bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/emty-cart.screen.dart';
import 'package:yes/presentation/screens/category/category_screen.dart';
import 'package:yes/presentation/screens/index/index.bloc.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'package:yes/presentation/shared/components/indicators.dart';
import 'package:yes/presentation/shared/helpers.dart';

import 'widgets/apply_cupon.dart';
import 'widgets/cart_bottom_nav.dart';
import 'widgets/cart_item_detail.dart';
import 'widgets/item_select_bar.dart';
import 'widgets/my_container.dart';
import 'widgets/offers.dart';
import 'widgets/user_adress.dart';
import 'widgets/wishlist/whish_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "shopping-bag";
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // late Client? currentUser;
  late String? currentUser;

//
  @override
  void initState() {
    super.initState();
    currentUser = AppService.currentUser.value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cartItems.isEmpty && state.isOrdered) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 30,
              title: AppBarTitle(title: 'Order'),
            ),
            body: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                var products = state.order?.products;

                return OrderView(
                  products: products,
                  status: state.order?.status ?? '-',
                );
              },
            ),
          );
        }

        if (state.cartItems.isEmpty) {
          return BlocBuilder<IndexBloc, int>(
            builder: (context, state) {
              return EmtyCartScreen(
                onStartShop: () {
                  context.read<IndexBloc>().resetIndex();
                  if (Navigator.canPop(context)) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      IndexScreen.routeName,
                      (route) => false,
                    );
                  }
                },
              );
            },
          );
        }
        return Scaffold(
          appBar: AppBar(
            actions: [
              FavoriteButton(),
            ],
            elevation: 0.6,
            title: AppBarTitle(title: 'Sebet'),
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
                    color: kWhite,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    child: Text(
                      // '${currentUser?.address}',
                      '-',
                      style: TextStyle(
                          color: kText1Color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TODO
                  UserAdress(
                      user: Client(
                    address: '-',
                    id: 1,
                    phone: '-',
                    name: '-',
                  )),
                  SizedBox(
                    height: 8,
                  ),
                  // * offers
                  Offers(),
                  // * choosen item counts..
                  ItemSelectBar(),
                  // * item detail list
                  ProductDetailList(),
                  // * Coupons
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              title: 'Secure Payments',
                            ),
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
      },
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

class OrderView extends StatelessWidget {
  const OrderView({
    Key? key,
    required this.products,
    required this.status,
  }) : super(key: key);

  final List<OrderProductEntity>? products;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: kBoxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sargydynyz barada',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 7,
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width - 50, 1),
            painter: DashedLineVerticalPainter(),
          ),
          // Divider(
          //   color: kGrey3Color,
          //   height: .4,
          //   thickness: .5,
          // ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusIndicator(
                label: status == 'CREATED' ? 'Sargydynyz kabul edildi' : '-',
              ),
              Button(
                text: 'Goý bolsun et',
                primary: kWhite,
                padding: EdgeInsets.zero,
                onPressed: () {},
                hasBorder: true,
                borderColor: kFailedColor,
                textColor: kFailedColor,
              )
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Harydyn ady'),
              Text('Sany'),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Divider(
            color: kGrey3Color,
            height: .4,
            thickness: .5,
          ),
          SizedBox(
            height: 4,
          ),
          Column(
            children: products
                    ?.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Haryt ${e.productId}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              'M X ${e.quantity}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ))
                    .toList() ??
                [],
          ),
          SizedBox(
            height: 14,
          ),
          Divider(
            color: kGrey3Color,
            height: .4,
            thickness: .5,
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jemi :'),
              Text('120 TMT'),
            ],
          )
        ],
      ),
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

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = kGrey1Color
      ..strokeWidth = 1;
    while (startY < size.width) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
