import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../../product_detail/product_detail_screen.dart';

class ProductsGridItem extends StatefulWidget {
  static const routeName = "product";
  final Product? product;
  final ProductEntity? item;
  final Color? bgColor;
  final String? gadgetImage;
  const ProductsGridItem(
      {Key? key, this.product, this.item, this.bgColor, this.gadgetImage})
      : super(key: key);

  @override
  State<ProductsGridItem> createState() => _ProductsGridItemState();
}

class _ProductsGridItemState extends State<ProductsGridItem> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return GestureDetector(
      onTap: () {
        _navigaTo(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[200]!),
        ),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Stack(
                children: [
                  buildProductImage(context, widget.gadgetImage),
                ],
              ),
            ),
            Expanded(
              flex: 5,
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
                        buildProductName(item, context),
                        buildLikeBtn(),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      item?.description_tm ?? '-',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 11,
                          ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // if (widget.product.discount != null)
                    //   RichText(
                    //     text: TextSpan(
                    //         text: '${widget.product.oldPrice}TMT',
                    //         style: TextStyle(
                    //           color: Colors.grey[400],
                    //           decoration: TextDecoration.lineThrough,
                    //           fontSize: 12,
                    //         ),
                    //         children: [
                    //           TextSpan(
                    //             text: '  ${widget.product.newPrice}TMT  ',
                    //             style: TextStyle(
                    //                 color: kText1Color,
                    //                 fontSize: 12,
                    //                 fontWeight: FontWeight.bold,
                    //                 decoration: TextDecoration.none),
                    //           ),
                    //           TextSpan(
                    //             text: '${widget.product.discount}% OFF',
                    //             style: TextStyle(
                    //                 color: Colors.red,
                    //                 fontSize: 12,
                    //                 decoration: TextDecoration.none),
                    //           ),
                    //         ]),
                    //   ),
                    // if (widget.product.discount == null)
                    Text.rich(
                      TextSpan(
                        text: "${item?.ourPrice ?? '-'} TMT",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
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

  void onLike() {
    setState(
      () {
        isLiked = !isLiked;
      },
    );
  }

  buildLikeBtn() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onLike,
        child: Icon(
          isLiked ? Icons.favorite_outlined : Icons.favorite_outline,
          size: 20,
          color: isLiked ? kPrimaryColor : Colors.grey[500],
        ),
      ),
    );
  }

  buildProductName(ProductEntity? item, BuildContext context) {
    return Expanded(
      flex: 9,
      child: Text(
        item?.name_tm?.toUpperCase() ?? '-',
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  buildProductImage(BuildContext context, String? image) {
    print(image);
    return Container(
      // width: MediaQuery.of(context).size.width / 2,
      height: double.infinity,
      width: double.infinity,
      color: widget.bgColor,
      child: image != null
          ? Image.network(
              cacheHeight: MediaQuery.of(context).size.width.toInt(),
              image,
              fit: BoxFit.cover,
            )
          : Text('Comes null'),
    );
  }

  void _navigaTo(context) {
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: {
      "product": widget.product,
    });
  }
}
