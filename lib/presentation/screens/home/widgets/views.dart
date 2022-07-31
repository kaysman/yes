// gridview
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_grid_item.dart';
import 'package:yes/presentation/shared/colors.dart';

class GadgetGridView extends StatelessWidget {
  const GadgetGridView({
    Key? key,
    required this.gadget,
  }) : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    final type = this.gadget.type;
    print(gadget.title == null);
    return Container(
      color: kWhite,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (gadget.title != null)
            Text(
              '${gadget.title}',
              style:
                  Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
            ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: type.crossAxisCount,
            childAspectRatio: 2.4 / 3,
            children: List.generate(
              gadget.items == null ? 4 : gadget.items!.length,
              (index) {
                final item = gadget.items?[index];
                final colors = bgColors.reversed.toList();
                return item?.getFullPathImage != null
                    ? Container(
                        color: colors[index],
                        padding: const EdgeInsets.all(5),
                        child: Image.network(
                          cacheHeight:
                              MediaQuery.of(context).size.height.toInt(),
                          item!.getFullPathImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        color: bgColors[index],
                        width: 200,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// listview
class GadgetListView extends StatelessWidget {
  const GadgetListView({Key? key, required this.gadget}) : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    var items = gadget.items;
    print(items);
    return Container(
      color: kWhite,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (gadget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                gadget.title!,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 20),
              ),
            ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                items?.length ?? bgColors.length,
                (index) {
                  var item = items?[index];
                  return item?.getFullPathImage != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          color: bgColors[index],
                          child: InkWell(
                            onTap: () {
                              print(item?.link);
                            },
                            child: Image.network(
                              cacheHeight:
                                  MediaQuery.of(context).size.height.toInt(),
                              item!.getFullPathImage!,
                              width: 185,
                            ),
                          ),
                        )
                      : Container(
                          width: 200,
                          color: bgColors[index],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// product list view
class GadgetProductListView extends StatelessWidget {
  const GadgetProductListView({Key? key, required this.gadget})
      : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    var items = gadget.products;
    var gadgets = gadget.items;

    return Container(
      color: kWhite,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (gadget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                gadget.title!,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 20),
              ),
            ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                items?.length ?? bgColors.length,
                (index) {
                  var item = items?[index];
                  var image = gadgets?[index];
                  // print(object)
                  return item != null
                      ? ProductsGridItem(
                          bgColor: bgColors[index],
                          item: item,
                          gadgetImage: image?.getFullPathImage,
                        )
                      : Container(
                          width: 200,
                          color: bgColors[index],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// swiper
class GadgetSwiperView extends StatefulWidget {
  const GadgetSwiperView({Key? key, required this.gadget}) : super(key: key);
  final GadgetEntity gadget;

  @override
  State<GadgetSwiperView> createState() => _GadgetSwiperViewState();
}

class _GadgetSwiperViewState extends State<GadgetSwiperView> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    var items = widget.gadget.items;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(
              items?.length ?? 0,
              (index) {
                var item = items![index];
                return Container(
                  child: item.getFullPathImage != null
                      ? Container(
                          width: double.infinity,
                          color: bgColors[index],
                          child: Image.network(
                            item.getFullPathImage!,
                            cacheWidth:
                                MediaQuery.of(context).size.width.toInt(),
                          ),
                        )
                      : Container(
                          color: bgColors[index],
                        ),
                );
              },
            ),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  activePage = index;
                });
              },
              viewportFraction: 1,
              autoPlay: true,
            ),
          ),
          Container(
            color: kWhite,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items?.length ?? bgColors.length,
                (index) => buildIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: activePage == index
              ? Colors.blueAccent.withOpacity(.7)
              : kGreyColor.withOpacity(.4),
          shape: BoxShape.circle),
    );
  }
}

// one image
class GadgetOneImageView extends StatelessWidget {
  const GadgetOneImageView({Key? key, required this.gadget}) : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    var item = gadget.items?.first;
    print(item?.link);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: item?.getFullPathImage != null
          ? Container(
              color: bgColors.last,
              child: Image.network(
                item!.getFullPathImage!,
                cacheWidth: MediaQuery.of(context).size.width.toInt(),
              ),
            )
          : Container(
              width: double.infinity,
              color: bgColors.last,
              height: 200,
            ),
    );
  }
}

// circle items

