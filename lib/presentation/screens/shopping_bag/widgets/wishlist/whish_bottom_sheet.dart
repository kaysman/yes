import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/wishList/wish-list.model.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'wish_grid_list.dart';
import 'wish_list_category.dart';

class WhishBottomSheet extends StatelessWidget {
  const WhishBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WhishListCategory(
                title: 'Wishlist',
                onSelected: false,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return BlocBuilder<WishListBloc, WishListState>(
                          builder: (context, state) {
                        return WishGridList(
                          categories: state.categories,
                          products: state.wishListItems,
                        );
                      });
                    }),
                  );
                },
                child: Container(
                  child: Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: BlocBuilder<WishListBloc, WishListState>(
                builder: (context, state) {
              return ListView.builder(
                  itemCount: state.wishListItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    var product = state.wishListItems[i];
                    return WishListCard(
                      product: product,
                      margin: const EdgeInsets.only(right: 5),
                      width: MediaQuery.of(context).size.width / 2.8,
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  final double? width;
  final EdgeInsets? margin;
  final WishListItem? product;
  final ValueSetter<int>? moveToBag;
  const WishListCard({Key? key, this.width, this.margin, this.product, this.moveToBag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: .3, color: Colors.black26)),
      margin: margin,
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 7,
          child: SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: Image.network(
                product?.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product?.name_tm ?? '',
                style: TextStyle(color: Colors.blueGrey[700], fontSize: 10),
              ),
              SizedBox(
                height: 3,
              ),
              RichText(
                text: TextSpan(
                  text: '${product?.price}',
                  style: TextStyle(
                      color: kText1Color,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                  // children: [
                  //   TextSpan(
                  //     text: '${product.newPrice}',
                  //     style: TextStyle(
                  //         color: Colors.blueGrey[300],
                  //         decoration: TextDecoration.lineThrough,
                  //         fontWeight: FontWeight.normal),
                  //   ),
                  //   TextSpan(
                  //     text: ' (${product.discount})',
                  //     style: TextStyle(
                  //         overflow: TextOverflow.ellipsis,
                  //         color: Colors.pink[400],
                  //         fontWeight: FontWeight.normal),
                  //   ),
                  // ],
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: .2,
          color: Colors.black26,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:()=> moveToBag!(product?.id ?? 0),
            splashColor: kPrimaryColor,
            child: Ink(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Text(
                'MOVE TO BAG',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ]),
    );
  }
}