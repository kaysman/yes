import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';

import '../shopping_bag/widgets/wish_grid_list.dart';
import 'widgets/banner.dart';
import 'widgets/brands.dart';
import 'widgets/promotions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('YES'),
        actions: [
          IconButton(
              onPressed: () {
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return WishGridList();
                }));
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 20,
              ))
        ],
        bottom: VipCategories(),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey.withOpacity(.05),
            child: Column(
              children: [
                HomeBanner(),
                SizedBox(
                  height: 25,
                ),
                Brands(),
                Promotions()
              ],
            )),
      ),
    );
  }
}
