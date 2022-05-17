import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yes_demo/data/db.dart';
import 'package:yes_demo/screens/product_detail/product_detail_screen.dart';

import '../../../helpers/colors.dart';
import '../../../models/product_model.dart';
import '../../../widgets/custom_new_branch.dart';
import '../../../widgets/custom_rating_bar.dart';

class ProductsGridItem extends StatefulWidget {
  final ProductsModel product;
  const ProductsGridItem({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductsGridItem> createState() => _ProductsGridItemState();
}

class _ProductsGridItemState extends State<ProductsGridItem> {
  bool isLiked = false;

  void onLike() {
    setState(
      () {
        isLiked = !isLiked;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigaTo(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: .4, color: grey2!),
        ),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        widget.product.imagePath!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (widget.product.isNew != false)
                    // * bolmeli
                    Positioned(
                      top: 5,
                      left: 0,
                      child: CustomNewBranch(
                          fontSize: 10, padding: const EdgeInsets.all(3)),
                    ),
                  if (widget.product.rating != null)
                    Positioned(
                      bottom: 12,
                      left: 10,
                      child: CustomRatingBar(
                          rating: widget.product.rating,
                          commentsCount: widget.product.commentCount),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 8,
                  left: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            widget.product.productName,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: text1Color,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: onLike,
                            child: Icon(
                              isLiked
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_outline,
                              size: 20,
                              color: isLiked ? primaryColor : Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(widget.product.productCode,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black38,
                            overflow: TextOverflow.ellipsis)),
                    SizedBox(
                      height: 4,
                    ),
                    if (widget.product.discount != null)
                      RichText(
                        text: TextSpan(
                            text: '${widget.product.oldPrice}TMT',
                            style: TextStyle(
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: '  ${widget.product.newPrice}TMT  ',
                                style: TextStyle(
                                    color: text1Color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              TextSpan(
                                text: '${widget.product.discount}% OFF',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            ]),
                      ),
                    if (widget.product.discount == null)
                      Text.rich(
                        TextSpan(
                          text: "${widget.product.productPrice}TMT",
                          style: TextStyle(
                            fontSize: 12,
                            color: text1Color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigaTo(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductDetailScreen(product: DataBase.products[0]);
        },
      ),
    );
  }
}
