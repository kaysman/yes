import 'package:flutter/material.dart';
import 'package:yes/data/models/categories_model.dart';
class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
   CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: 
                 categories
                    .map((e) => _CategoryListSubCategory(
                          data: e,
                        ))
                    .toList()
                ));
  }
}

class _CategoryListSubCategory extends StatefulWidget {
  final CategoryModel data;
  _CategoryListSubCategory({Key? key, required this.data}) : super(key: key);

  @override
  State<_CategoryListSubCategory> createState() =>
      __CategoryListSubCategoryState();
}

class __CategoryListSubCategoryState extends State<_CategoryListSubCategory> {
  bool isOpened = false;

  void dropDown() {
    setState(() {
      isOpened = !isOpened;
    });
  }

  Icon changeIcon() {
    if (isOpened) {
      return const Icon(
        Icons.keyboard_arrow_up_sharp,
        color: Colors.grey,
        size: 18,
      );
    }
    return const Icon(
      Icons.keyboard_arrow_down_sharp,
      size: 18,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: dropDown,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Container(
            height: 120,
            padding: const EdgeInsets.only(left: 18, right: 18),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    widget.data.background_image ?? '',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data.title_tm ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              if (widget.data.sub != null) changeIcon()
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.data.subtitle_tm ?? '',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    // color: primaryColor,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            widget.data.image ?? '',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      if (isOpened)
        // if (widget.data.sub != null)
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: SubCategoryItem(subCategories: widget.data.sub ?? []),
          ),
    ]);
  }
}

class SubCategoryItem extends StatefulWidget {
  final List<CategoryModel> subCategories;
  SubCategoryItem({
    Key? key,
    required
    this.subCategories,
  }) : super(key: key);

  @override
  State<SubCategoryItem> createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.subCategories[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: widget.subCategories
          .map(
            (e) => ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: e.isExpanded ?? false,
              headerBuilder: (context, isExpanded) {
                return ListTile(title: Text(e.title_tm ?? ''));
              },
              body: Column(
                children: e.sub
                    ?.map((e) => ListTile(title: Text(e.subtitle_tm ?? '')))
                    .toList() ?? [],
              ),
            ),
          )
          .toList(),
    );
  }
}
