import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/widgets/home-app-bar.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/button.dart';
import 'views.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, b) {
          return [
            SliverAppBar(
              leadingWidth: 1,
              automaticallyImplyLeading: false,
              forceElevated: true,
              centerTitle: false,
              title: VipCategories(
                isLoading: true,
                gadget: GadgetEntity(
                  type: GadgetType.CIRCLE_ITEMS,
                ),
              ),
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
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // flex: 8,
              child: Text(
                'Internet baglanyşygy ýok',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: kFailedColor),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Button(
                  icon: Icon(Icons.refresh),
                  text: 'Sahypany täzele',
                  primary: kPrimaryColor,
                  onPressed: () {
                    context.read<HomeBloc>().fetchGadgets();
                  },
                  textColor: kWhite,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
