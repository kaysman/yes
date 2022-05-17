import 'package:flutter/material.dart';
import 'package:yes_demo/data/db.dart';
import 'package:yes_demo/screens/cart/cart_screen.dart';
import 'package:yes_demo/screens/cart/widgets/my_container.dart';
import 'package:yes_demo/screens/cart/widgets/whish_bottom_sheet.dart';
import 'package:yes_demo/screens/cart/widgets/wish_list_category.dart';

import '../../../helpers/colors.dart';

class WishGridList extends StatefulWidget {
  WishGridList({Key? key}) : super(key: key);

  @override
  State<WishGridList> createState() => _WishGridListState();
}

class _WishGridListState extends State<WishGridList> {
  List<Category> categories = [
    Category(title: 'All'),
    Category(title: 'Trolley Bag'),
    Category(title: 'Shirts'),
    Category(title: 'Trolley Bag'),
    Category(title: 'Kurta Sets'),
    Category(title: 'Shirts'),
    Category(title: 'Kurta Sets'),
    Category(title: 'Shirts'),
  ];

  void onSelect(int i) {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i].isSelected = false;
      }
      categories[i].isSelected = true;
    });
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
                  color: text1Color,
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
                    color: text1Color,
                  ),
                ),
              ),
            ],
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
                    itemCount: categories.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: InkWell(
                          onTap: () {
                            onSelect(i);
                            print(categories[i].isSelected);
                          },
                          child: WhishListCategory(
                            onSelected: categories[i].isSelected,
                            title: categories[i].title,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 9,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  4,
                  (index) => WishListCard(
                    product: DataBase.products[index],
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  final String title;
  bool isSelected;

  Category({required this.title, this.isSelected = false});
}
