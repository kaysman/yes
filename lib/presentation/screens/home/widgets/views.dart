// gridview
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (gadget.title != null)
            Text(
              '${gadget.title}',
              style: Theme.of(context).textTheme.headline6,
            ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: type.crossAxisCount,
            childAspectRatio: 2 / 3,
            children: List.generate(
              gadget.items?.length ?? 0,
              (index) {
                final item = gadget.items![index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: item.getFullPathImage != null
                            ? Image.network(
                                item.getFullPathImage!,
                                fit: BoxFit.cover,
                              )
                            : SizedBox(),
                      ),
                      Text(item.link ?? ''),
                    ],
                  ),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (gadget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                gadget.title!,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                items?.length ?? 0,
                (index) {
                  var item = items?[index];
                  return item?.getFullPathImage != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              print(item?.link);
                            },
                            child: Image.network(
                              item!.getFullPathImage!,
                            ),
                          ),
                        )
                      : SizedBox();
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
class GadgetSwiperView extends StatelessWidget {
  const GadgetSwiperView({Key? key, required this.gadget}) : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    var items = gadget.items;
    return Container(
      child: CarouselSlider(
        items: List.generate(
          items?.length ?? 0,
          (index) {
            var item = items![index];
            return Container(
              child: item.getFullPathImage != null
                  ? Image.network(item.getFullPathImage!)
                  : SizedBox(),
            );
          },
        ),
        options: CarouselOptions(
          onPageChanged: (index, reason) {},
          height: 400,
          viewportFraction: 1,
          reverse: true,
        ),
      ),
    );
  }
}

// one image
class GadgetOneImageView extends StatelessWidget {
  const GadgetOneImageView({Key? key, required this.gadget}) : super(key: key);
  final GadgetEntity gadget;
  @override
  Widget build(BuildContext context) {
    var item = gadget.items!.first;
    print(item.link);
    return Container(
      // height: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: item.getFullPathImage != null
          ? Image.network(item.getFullPathImage!)
          : Container(
              width: double.infinity,
              color: bgColors.last,
              height: 200,
            ),
    );
  }
}

// circle items

