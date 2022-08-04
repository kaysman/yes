import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/models/wishList/wish-list.model.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/wish_list_category.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../../cart_screen.dart';
import '../my_container.dart';
import 'whish_bottom_sheet.dart';

class WishGridList extends StatefulWidget {
  static const routeName = "wish-list";

  WishGridList({
    Key? key,
    this.categories,
    this.products,
    this.filteredList,
  }) : super(key: key);

  final List<Category>? categories;
  final List<WishListItem>? products;
  final List<WishListItem>? filteredList;
  @override
  State<WishGridList> createState() => _WishGridListState();
}

class _WishGridListState extends State<WishGridList> {
  late WishListBloc wishListBloc;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    wishListBloc = BlocProvider.of(context);
  }

  void onSelect(int i) {
    setState(
      () {
        for (var i = 0; i < widget.categories!.length; i++) {
          widget.categories![i].isSelected = false;
        }
        widget.categories![i].isSelected = true;
      },
    );
    wishListBloc.onSelectCategory(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.delete,
                  size: 18,
                  color: kText1Color,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                    color: kText1Color,
                  ),
                ),
              ),
            ],
          )
        ],
        elevation: 0.6,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Whishlist",
                style: TextStyleUtils().boldText,
              ),
              Text(
                '5 items',
                style: TextStyleUtils().smallthinText,
              )
            ],
          ),
        ),
      ),
      body: MyContainer(
        pHorizontal: 5,
        pVertical: 5,
        widget: Column(
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categories?.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: InkWell(
                          onTap: () {
                            onSelect(i);
                            // print(categories[i].isSelected);
                          },
                          child: WhishListCategory(
                            onSelected:
                                widget.categories?[i].isSelected ?? false,
                            title: widget.categories?[i].title_tm ?? '',
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 9,
              child: BlocConsumer<WishListBloc, WishListState>(
                  listener: (_, state) {},
                  builder: (context, state) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        widget.products?.length ?? 0,
                        (index) => Opacity(
                          opacity: opacity,
                          child: WishListCard(
                            moveToBag: (val) {
                              wishListBloc.moveToBag(val);
                            },
                            width: MediaQuery.of(context).size.width / 2.5,
                            product: widget.products?[index],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
