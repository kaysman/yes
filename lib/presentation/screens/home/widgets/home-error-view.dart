import 'package:flutter/material.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/shared/colors.dart';

import 'views.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(),
        elevation: 1,
        actions: [
          // buildIconBtn(
          //   context,
          //   () {
          //     Navigator.pushNamed(context, 'search');
          //   },
          //   Icons.search,
          // ),
          // BlocBuilder<WishListBloc, WishListState>(builder: (context, state) {
          //   return buildIconBtn(
          //     context,
          //     () {
          //       Navigator.of(context).pushNamed(
          //         WishGridList.routeName,
          //         arguments: {
          //           'products': state.wishListItems,
          //           'categories': state.categories,
          //           'filteredList': state.filteredList,
          //         },
          //       );
          //     },
          //     Icons.favorite_border,
          //   );
          // }),
          // buildIconBtn(
          //   context,
          //   () {
          //     Navigator.pushNamed(context, 'shopping-bag');
          //   },
          //   Icons.shopping_bag_outlined,
          // ),
        ],
        // bottom: VipCategories(
        //   gadget: GadgetEntity(
        //     type: GadgetType.CIRCLE_ITEMS,
        //   ),
        // ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, b) {
          return [
            SliverAppBar(
              leadingWidth: 1,
              automaticallyImplyLeading: false,
              forceElevated: true,
              centerTitle: false,
              title: Container(
                // color: kBlack,
                child: VipCategories(
                  isLoading: true,
                  gadget: GadgetEntity(
                    type: GadgetType.CIRCLE_ITEMS,
                  ),
                ),
              ),
              // leading:
              // title:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            ),
          ];
        },
        body: ListView(
          children: [
            GadgetOneImageView(
              gadget: GadgetEntity(
                type: GadgetType.BANNER_FOR_MEN_AND_WOMEN,
              ),
            ),
            GadgetSwiperView(
              gadget: GadgetEntity(
                type: GadgetType.BANNER_SWIPE_WITH_DOTS,
              ),
            ),
            GadgetListView(
              gadget: GadgetEntity(
                type: GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT,
              ),
            ),
            GadgetGridView(
              gadget: GadgetEntity(
                type: GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT,
              ),
            ),
            GadgetProductListView(
              gadget: GadgetEntity(
                type: GadgetType
                    .TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
