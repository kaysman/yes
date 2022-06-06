import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/category/category.bloc.dart';
import '../../../shared/colors.dart';
class VipCategories extends StatefulWidget with PreferredSizeWidget {
  
  VipCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<VipCategories> createState() => _VipCategoriesState();
  
  @override
  Size get preferredSize =>Size.fromHeight(90);
}

class _VipCategoriesState extends State<VipCategories> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Container(
          height: 80,
          child: ListView.builder(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
              scrollDirection: Axis.horizontal,
              itemCount: state.homeCategories?.length ?? bgColors.length,
              itemBuilder: (context, i) {
                return state.homeStatus == HomeCategoryFetchingStatus.Loading
                    ? Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 60,
                        color: bgColors[i],
                      )
                    : Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(state.homeCategories?[i].image ?? ''),
                                  ),
                                  shape: BoxShape.circle),
                            ),
                            Text(
                              state.homeCategories?[i].title_tm ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kText1Color,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      );
              }),
        );
      }
    );
  }

}
