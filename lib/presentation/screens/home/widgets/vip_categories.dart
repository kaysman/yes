import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:yes/data/models/category-new/category.model.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import '../../../shared/colors.dart';

class VipCategories extends StatelessWidget with PreferredSizeWidget {
  VipCategories({
    Key? key,
    required this.gadget,
    required this.isLoading,
  }) : super(key: key);

  final GadgetEntity? gadget;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    var items = gadget?.items;
    return Container(
      height: 140,
      child: ListView.builder(
        padding: isLoading
            ? const EdgeInsets.only(
                left: 15,
                bottom: 10,
              )
            : null,
        scrollDirection: Axis.horizontal,
        itemCount: items == null ? bgColors.length : items.length,
        itemBuilder: (context, i) {
          var item = items?[i];
          List<CategoryEntity> subs = [
            CategoryEntity(
              id: 1,
              title_tm: '${gadget?.type.name} ${Faker().person.firstName()}',
            ),
            CategoryEntity(
              id: 2,
              title_tm: '${gadget?.type.name} ${Faker().person.firstName()}',
            ),
            CategoryEntity(
              id: 3,
              title_tm: '${gadget?.type.name} ${Faker().person.firstName()}',
            ),
            CategoryEntity(
              id: 5,
              title_tm: '${gadget?.type.name} ${Faker().person.firstName()}',
            ),
          ];
          return item == null
              ? Container(
                  margin: isLoading ? const EdgeInsets.only(right: 10) : null,
                  color: bgColors[i],
                  height: 80,
                  width: 80,
                )
              : InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(SubCategoryList.routeName, arguments: {
                      'subCategories': subs,
                    });
                  },
                  child: Container(
                    margin: isLoading ? const EdgeInsets.only(right: 10) : null,
                    color: bgColors[i],
                    child: Image.network(
                      width: MediaQuery.of(context).size.width * 0.2,
                      item.getFullPathImage!,
                      // fit: BoxFit.cover,
                    ),
                  ),
                );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        200,
      );
}

class SubCategoryList extends StatelessWidget {
  static const routeName = 'subcategory-list';
  const SubCategoryList({
    Key? key,
    required this.subCategories,
  }) : super(key: key);

  final List<CategoryEntity> subCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: GridView.count(
          childAspectRatio: 1 / 1.3,
          crossAxisCount: 3,
          children: subCategories
              .map(
                (e) => buildSubItem(context, title: e.title_tm, url: ''),
              )
              .toList(),
        ),
      ),
    );
  }

  Container buildSubItem(
    BuildContext context, {
    String? url,
    String? title,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .14,
            decoration: BoxDecoration(
              color: kWhite,
              shape: BoxShape.circle,
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/trend.png',
                ),
              ),
            ),
            // child: ,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title ?? '-',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
