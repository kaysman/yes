import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/widgets/custom_rating_bar.dart';

import '../../models/product_model.dart';
import '../../widgets/custom_indicator.dart';
import '../../widgets/custom_new_branch.dart';
import 'widgets/app_bar_icon_btn.dart';
import 'widgets/product_detail_bootm_nav.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductsModel product;
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ProductDetailBottomNav(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.only(top: 5),
            child: AppBarIconBtn(
              icon: Icons.arrow_back,
              onPressed: () {},
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  AppBarIconBtn(icon: Icons.share, onPressed: () {}),
                  AppBarIconBtn(icon: Icons.favorite_outline, onPressed: () {}),
                  AppBarIconBtn(
                      icon: Icons.shopping_bag_outlined, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    if (widget.product.detailImages != null)
                      Container(
                        width: double.infinity,
                        child: CarouselSlider(
                          items: List.generate(
                              widget.product.detailImages!.length,
                              (index) => SizedBox(
                                    width: double.infinity,
                                    child: Image.asset(
                                      widget.product.detailImages![index],
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                          options: CarouselOptions(
                              onPageChanged: (index, reason) => setState(() {
                                    activePage = index;
                                  }),
                              height: 485,
                              viewportFraction: 1,
                              reverse: true),
                        ),
                      ),
                    Positioned(
                        top: 50,
                        left: 0,
                        child: CustomNewBranch(
                          fontSize: 13,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 2),
                        )),
                    Positioned(
                        bottom: 15,
                        right: 10,
                        child: CustomRatingBar(
                            rating: widget.product.rating,
                            commentsCount: widget.product.commentCount))
                  ],
                ),
                if (widget.product.detailImages != null)
                  Container(
                    color: whiteColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.product.detailImages!.length,
                        (index) => buildIndicator(index),
                      ),
                    ),
                  ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 15, right: 15),
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'U.S. Polo Assn.  ',
                          style: TextStyle(
                            fontSize: 15,
                            color: text1Color,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                                text: widget.product.productName,
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                      Text(
                        widget.product.productCode,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      if (widget.product.discount != null)
                        RichText(
                          text: TextSpan(
                              text: '${widget.product.oldPrice}TMT',
                              style: TextStyle(
                                color: Colors.grey[400],
                                decoration: TextDecoration.lineThrough,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: '  ${widget.product.newPrice}TMT  ',
                                  style: TextStyle(
                                      color: text1Color,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                TextSpan(
                                  text: '${widget.product.discount}% OFF',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      decoration: TextDecoration.none),
                                ),
                              ]),
                        ),
                      if (widget.product.discount == null)
                        Text.rich(
                          TextSpan(
                            text: "${widget.product.productPrice}TMT",
                            style: TextStyle(fontSize: 15, color: text1Color),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // * SaveMoneyWidget
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Buy it for ',
                                    style: TextStyle(
                                        color: text1Color,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      // * keep it Db
                                      TextSpan(
                                        text:
                                            '${widget.product.productPrice - 300.0}TMT',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  'Save 300TMT',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 110, 83),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Use at checkout',
                              style: TextStyle(fontSize: 12, color: text1Color),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    'Orders above Rs.1999 (only on first purchase)',
                                    style: TextStyle(
                                        color: text1Color, fontSize: 11),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'View Products',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                          ]),
                      Container(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.grey[300],
                          height: 1,
                          thickness: .5,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        color: whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Emi option available',
                                  style: TextStyle(
                                      color: text1Color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'View Plan',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Emi starting from 90TMT/month',
                              style: TextStyle(color: text1Color, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // * Size Box
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  // height: 100,
                  width: double.infinity,
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Size',
                            style: TextStyle(
                                color: text1Color,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Size chart',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizeBox(size: 'XS'),
                          SizeBox(size: 'S'),
                          SizeBox(size: 'XL'),
                          SizeBox(size: 'M'),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // * Fit etc..
                Container(
                  width: double.infinity,
                  color: whiteColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RowText(
                                    botT: 'Regular Fit',
                                    topT: 'Fit',
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  RowText(
                                    botT: 'Regular Fit',
                                    topT: 'Fit',
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  RowText(
                                    botT: 'Regular Fit',
                                    topT: 'Fit',
                                  ),
                                  RowText(
                                    botT: 'Regular Fit',
                                    topT: 'Fit',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Product Details',
                                    style: TextStyle(
                                        color: text1Color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    children: [
                                      DetailsList(text: 'Green Tshirt for men'),
                                      DetailsList(text: 'Solid'),
                                      DetailsList(text: 'Polo collar'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              RowText(
                                botT: 'Typography or Slogan Print',
                                topT: 'Main Trend',
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              RowText(
                                botT: 'Regular Fit',
                                topT: 'Fit',
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              RowText(
                                botT: 'Regular Fit',
                                topT: 'Fit',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )),
                      ]),
                ),

                // * Quality part

                SizedBox(
                  height: 15,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  color: whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.generating_tokens_outlined,
                                color: primaryColor,
                              ),
                              Text(
                                'Geniune Product',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: VerticalDivider(
                            thickness: .5, width: 2, color: Colors.black26),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.generating_tokens_outlined,
                                color: primaryColor,
                              ),
                              Text(
                                'Geniune Product',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: activePage == index ? Colors.pinkAccent : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class DetailsList extends StatelessWidget {
  final String text;
  const DetailsList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: text1Color),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            text,
            style: TextStyle(
              color: text1Color,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String topT;
  final String botT;
  const RowText({Key? key, required this.topT, required this.botT})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topT,
            style: TextStyle(
                color: text1Color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            botT,
            style: TextStyle(
              color: text1Color,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Divider(height: .5, color: Colors.black26, thickness: .5)
        ],
      ),
    );
  }
}

class SizeBox extends StatefulWidget {
  final String size;
  SizeBox({Key? key, required this.size}) : super(key: key);

  @override
  State<SizeBox> createState() => _SizeBoxState();
}

class _SizeBoxState extends State<SizeBox> {
  bool isSelected = false;

  void selectSize() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectSize();
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isSelected ? primaryColor : text1Color,
            ),
            shape: BoxShape.circle),
        child: Text(
          widget.size,
          style: TextStyle(
            color: text1Color,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
