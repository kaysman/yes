import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/data/models/gadget/image.model.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/data/models/product/products.model.dart';
import 'package:yes/data/service/promtion_service.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_grid_item.dart';
import 'package:yes/presentation/screens/home/widgets/views.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';

import '../../../data/enums/gadget-type.dart';
import '../shopping_bag/shopping_bag.bloc.dart';
import '../shopping_bag/widgets/wishlist/wish_grid_list.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  GadgetType? selectedType;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        // loading widget
        if (state.gadgetFetchingStatus == GadgetFetchingStatus.Loading) {
          return SizedBox();
        }

        // error widget

        var types = state.gadgets;
        var circleItems =
            types?.firstWhere((e) => e.type == GadgetType.CIRCLE_ITEMS);
        return Scaffold(
          appBar: AppBar(
            title: Logo(),
            actions: [
              buildIconBtn(
                context,
                () {
                  Navigator.pushNamed(context, 'search');
                },
                Icons.search,
              ),
              BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                return buildIconBtn(
                  context,
                  () {
                    Navigator.of(context).pushNamed(
                      WishGridList.routeName,
                      arguments: {
                        'products': state.wishListItems,
                        'categories': state.categories,
                        'filteredList': state.filteredList,
                      },
                    );
                  },
                  Icons.favorite_border,
                );
              }),
              Stack(
                children: [
                  buildIconBtn(
                    context,
                    () {
                      Navigator.pushNamed(context, 'shopping-bag');
                    },
                    Icons.shopping_bag_outlined,
                  ),
                  BlocBuilder<ShoppingBagBloc, ShoppingBagState>(
                    builder: (context, state) {
                      return state.productsSelectedCount > 0
                          ? Positioned(
                              top: 10,
                              right: 6,
                              child: ProductCountIndicator(
                                state: state,
                              ),
                            )
                          : SizedBox.shrink();
                    },
                  )
                ],
              )
            ],
            bottom: VipCategories(gadget: circleItems),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey.withOpacity(.05),
              child: Column(
                children: List.generate(
                  state.gadgets?.length ?? 0,
                  (index) {
                    var gadget = state.gadgets![index];
                    switch (gadget.type) {
                      case GadgetType.BANNER_FOR_MEN_AND_WOMEN:
                      case GadgetType.ONE_IMAGE_WITH_FULL_WIDTH:
                        return GadgetOneImageView(
                          gadget: gadget,
                        );
                      // grid
                      case GadgetType.TWO_SMALL_CARDS_HORIZONTAL:
                      case GadgetType.TWO_TO_TWO_WITH_TITLE_AS_IMAGE:
                      case GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT:
                      case GadgetType.THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT:
                        return GadgetGridView(gadget: gadget);

                      // listview
                      case GadgetType
                          .CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
                      case GadgetType
                          .CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
                      case GadgetType
                          .CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
                      case GadgetType
                          .CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
                      case GadgetType
                          .TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
                      case GadgetType.CATEGORY_BANNER:
                        return GadgetListView(
                          gadget: gadget,
                        );

                      // Banners, One Image
                      case GadgetType.BANNER_SWIPE_WITH_DOTS:
                        return GadgetSwiperView(
                          gadget: gadget,
                        );

                      default:
                        return SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildIconBtn(BuildContext context, VoidCallback onTap, IconData icon) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 26,
      ),
    );
  }
}

class GadgetView extends StatefulWidget {
  GadgetView({
    Key? key,
    required this.gadget,
  }) : super(key: key);
  final GadgetEntity gadget;

  @override
  State<GadgetView> createState() => _GadgetViewState();
}

class _GadgetViewState extends State<GadgetView> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Container(
    //   color: kWhite,
    //   child: () {
    //           switch (widget.gadget.type) {
    //             case GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT:
    //               return GridTwoTwoTitleAsText(items: [], title: '',);
    //             case GadgetType
    //                 .TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
    //               return Container(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 20, horizontal: 10),
    //                 height: 400,
    //                 width: MediaQuery.of(context).size.width,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(bottom: 10.0),
    //                       child: Text(
    //                         'Our brands are best'.toUpperCase(),
    //                         style: Theme.of(context).textTheme.bodyLarge,
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: ListView.builder(
    //                           shrinkWrap: true,
    //                           scrollDirection: Axis.horizontal,
    //                           itemCount: ,
    //                           itemBuilder: (_, i) {
    //                             return Container(
    //                               margin: const EdgeInsets.only(right: 10),
    //                               child: ProductsGridItem(
    //                                   product: widget.items?[i]),
    //                             );
    //                           },),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             case GadgetType.BANNER_SWIPE_WITH_DOTS:
    //               return CarouselSlider(
    //                 items: List.generate(
    //                     bgColors.length,
    //                     (index) => SizedBox(
    //                           width: double.infinity,
    //                           child: Container(
    //                             color: bgColors[index],
    //                           ),
    //                         )),
    //                 options: CarouselOptions(
    //                   onPageChanged: (index, reason) => setState(() {
    //                     activePage = index;
    //                   }),
    //                   height: 400,
    //                   viewportFraction: 1,
    //                   reverse: true,
    //                 ),
    //               );
    //             default:
    //               return null;
    //           }
    //         }(),
    // );
  }
}

class GridTwoTwoTitleAsText extends StatelessWidget {
  const GridTwoTwoTitleAsText({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<GadgetImage> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 2,
            children: items
                .map(
                  (e) => e.getFullPathImage != null
                      ? InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductsGridItem.routeName,
                                arguments: {"": ""});
                          },
                          child: Image.network(e.getFullPathImage!))
                      : SizedBox(),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProductCountIndicator extends StatelessWidget {
  const ProductCountIndicator({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ShoppingBagState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
      child: Text(
        '${state.productsCount}',
        style:
            TextStyle(color: kWhite, fontSize: 8, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Colors.deepOrange, shape: BoxShape.circle),
      child: const Text(
        'YES.',
        style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: -1.2),
      ),
    );
  }
}
