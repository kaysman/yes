import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/carusel-image.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/app-loading-bar.dart';

class ProductDetailScreenLoading extends StatelessWidget {
  static const routeName = "product-detail";
  final ProductEntity product;
  ProductDetailScreenLoading({Key? key, required this.product})
      : super(key: key);

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   bottomNavigationBar: ProductDetailBottomNavBar(product: product),
        //   extendBodyBehindAppBar: true,
        //   appBar: AppBar(
        //     toolbarHeight: 45,
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //     leading: Container(
        //       margin: const EdgeInsets.only(top: 5),
        //       child: AppBarIconBtn(
        //         icon: Icons.arrow_back,
        //         onPressed: () {},
        //       ),
        //     ),
        //     actions: [
        //       Container(
        //         margin: const EdgeInsets.only(top: 5),
        //         child: Row(
        //           children: [
        //             AppBarIconBtn(icon: Icons.share, onPressed: () {}),
        //             AppBarIconBtn(icon: Icons.favorite_outline, onPressed: () {}),
        //             AppBarIconBtn(
        //                 icon: Icons.shopping_bag_outlined, onPressed: () {}),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        //   body:
        Container(
      // color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.images != null)
              CaruselProductImages(
                onPageCahnge: (v) {},
                images: product.images,
              ),
            if (product.images != null)
              Container(
                color: kWhite,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    product.images!.length,
                    (index) => buildIndicator(index),
                  ),
                ),
              ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
              color: kWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'U.S. Polo Assn.  ',
                      style: TextStyle(
                        fontSize: 15,
                        color: kText1Color,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: product.name_tm,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Text(
                    product.description_tm!,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "${product.ourPrice} TMT",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            AppLoadingBar(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  buildIndicator(int index) {
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
