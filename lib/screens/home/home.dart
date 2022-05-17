import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yes_demo/global_providers/category_provider.dart';
import 'package:yes_demo/screens/home/brands.dart';
import 'package:yes_demo/screens/home/widgets/banner.dart';
import 'package:yes_demo/screens/home/widgets/vip_categories.dart';
import '../../helpers/colors.dart';
import 'promotions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text('Home'),
          bottom: VipCategories(
              category: categoryData.categories,
              isLoading: categoryData.isLoading),
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
                  )
                ),
              ),
      ),
    );
  }
}


