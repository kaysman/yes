import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/widgets/home-error-view.dart';
import 'package:yes/presentation/screens/home/widgets/views.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/icons.dart';

import '../../../data/enums/gadget-type.dart';
import '../../shared/components/app-loading-bar.dart';
import '../cart/widgets/wishlist/bloc/wishList.bloc.dart';
import '../cart/widgets/wishlist/wish_grid_list.dart';

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

        if (state.gadgetFetchingStatus == GadgetFetchingStatus.Error) {
          return HomeErrorView(state: state);
        }
        // error widget

        var types = state.gadgets;
        var circleItems =
            types?.firstWhere((e) => e.type == GadgetType.CIRCLE_ITEMS);
        return Scaffold(
          appBar: AppBar(
            elevation: .5,
            title: Logo(),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'search');
                },
                icon: AppIcons.svgAsset(
                  AppIcons.search,
                  color: kText1Color,
                ),
              ),
              BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      WishGridList.routeName,
                      arguments: {
                        'products': state.wishListItems,
                        'categories': state.categories,
                        'filteredList': state.filteredList,
                      },
                    );
                  },
                  icon: Icon(Icons.favorite_border),
                );
              }),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'shopping-bag');
                    },
                    icon: Image.asset(
                      AppIcons.bag,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.cartItems.length > 0
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
          ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 80,
                  leadingWidth: 0,
                  title: VipCategories(
                    isLoading: false,
                    gadget: circleItems,
                  ),
                )
              ];
            },
            body: state.gadgetFetchingStatus == GadgetFetchingStatus.Loading
                ? AppLoadingBar()
                : Container(
                    color: kGrey5Color,
                    child: ListView(
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
                            case GadgetType
                                .THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT:
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
                            case GadgetType.CATEGORY_BANNER:
                              return GadgetListView(
                                gadget: gadget,
                              );

                            case GadgetType
                                .TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
                              return GadgetProductListView(gadget: gadget);

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
}

class ProductCountIndicator extends StatelessWidget {
  const ProductCountIndicator({
    Key? key,
    required this.state,
  }) : super(key: key);
  final CartState state;

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
          letterSpacing: -1.2,
        ),
      ),
    );
  }
}
