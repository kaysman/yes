import 'package:flutter/material.dart';
import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/presentation/screens/category/widgets/expansion_panel.dart'
    as KExpansionPanel;
import 'package:yes/presentation/shared/colors.dart';

class CategoryList extends StatefulWidget {
  final List<Category>? category;
  CategoryList({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: KExpansionPanel.ExpansionPanelList(
        elevation: 0,
        animationDuration: Duration(milliseconds: 1000),
        expandedHeaderPadding: EdgeInsets.all(0),
        expansionCallback: (panelIndex, isExpanded) => setState(() {
          widget.category![panelIndex].isExpanded = !isExpanded;
        }),
        children: widget.category!
            .map(
              (e) => KExpansionPanel.ExpansionPanel(
                hasIcon: false,
                canTapOnHeader: true,
                isExpanded: e.isExpanded,
                headerBuilder: (context, isExpanded) =>
                    _CategoryListSubCategory(data: e, isExpanded: e.isExpanded),
                body: SubCategoryItem(
                  subCategories: e.sub,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CategoryListSubCategory extends StatefulWidget {
  final Category data;
  final bool? isExpanded;
  _CategoryListSubCategory({
    Key? key,
    required this.data,
    this.isExpanded,
  }) : super(key: key);

  @override
  State<_CategoryListSubCategory> createState() =>
      __CategoryListSubCategoryState();
}

class __CategoryListSubCategoryState extends State<_CategoryListSubCategory> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Container(
          height: 120,
          padding: const EdgeInsets.only(left: 18, right: 18),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
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
                            if (widget.data.sub != null)
                              AnimatedRotation(
                                turns: widget.data.isExpanded
                                    ? turns - 4.0 / 8.0
                                    : turns,
                                duration: const Duration(seconds: 1),
                                child: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ),
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
                        child: Image.network(
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
    ]);
  }
}

class SubCategoryItem extends StatefulWidget {
  final List<Category>? subCategories;
  SubCategoryItem({
    Key? key,
    required this.subCategories,
  }) : super(key: key);

  @override
  State<SubCategoryItem> createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.subCategories!.map((e) {
        return InkWell(
          splashColor: kScaffoldBgColor,
          onTap: () {},
          child: ListTile(
            title: Text(e.title_tm!),
          ),
        );
      }).toList(),
    );
  }
}
