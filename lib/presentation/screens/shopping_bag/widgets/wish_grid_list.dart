import 'package:flutter/material.dart';
import 'package:yes/data/constants.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/whish_bottom_sheet.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wish_list_category.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../shopping_bag_screen.dart';
import 'my_container.dart';

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
                    product: products[index],
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
