import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/products/products_screen.dart';
import 'package:yes/presentation/shared/colors.dart';

class Promotions extends StatelessWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROMOTIONS',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: kText1Color),
          ),
          SizedBox(
            height: 250,
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemCount: state.promotions?.length ?? bgColors.length,
                itemBuilder: (context, i) {
                  return state.promotionFetchingStatus ==
                          PromotionFetchingStatus.Loading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: double.infinity,
                          margin: const EdgeInsets.only(right: 15),
                          color: bgColors[i],
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductsScreen.routeName,
                              arguments: {
                                "promotionId": state.promotions?[i].id
                              },
                            );
                          },
                          child: Container(
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                    state.promotions?[i].background_image ??
                                        ''),
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          width: double.infinity,
                                          child: Image.network(
                                            state.promotions?[i].image ?? '',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: -15,
                                            child: Container(
                                              child: Image.network(
                                                state.promotions?[i].brand
                                                        ?.imageWithPrefix ??
                                                    '',
                                                height: 30,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 25),
                                              decoration: BoxDecoration(
                                                  color: kWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                            ))
                                      ]),
                                ),
                                Container(
                                  child: Text(
                                    state.promotions?[i].category?.title_tm ??
                                        '',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
