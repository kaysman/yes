import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/shared/colors.dart';

class Brands extends StatelessWidget {
  const Brands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MARKALAR',
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
                itemCount: state.brands?.length ?? bgColors.length,
                itemBuilder: (context, i) {
                  return state.brandFetchingStatus ==
                          BrandFetchingStatus.Loading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: double.infinity,
                          margin: const EdgeInsets.only(right: 15),
                          color: bgColors[i],
                        )
                      : Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  state.brands?[i].background ?? ''),
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
                                          state.brands?[i].image ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: -15,
                                          child: Container(
                                            child: Image.network(
                                              state.brands?[i].logo ?? '',
                                              height: 30,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 25),
                                            decoration: BoxDecoration(
                                                color: kWhite,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ))
                                    ]),
                              ),
                              Container(
                                child: Text(
                                  state.brands?[i].name ?? '',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              )
                            ],
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
