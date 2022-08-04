import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/cart/cart_screen.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';
import 'package:yes/presentation/screens/index/index.bloc.dart';

import '../../shared/helpers.dart';
import '../category/category_screen.dart';
import '../profile/profile_screen.dart';

class IndexScreen extends StatefulWidget {
  static const routeName = "index";
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late IndexBloc indexBloc;

  @override
  void initState() {
    indexBloc = BlocProvider.of<IndexBloc>(context);
    super.initState();
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, int>(
        bloc: indexBloc,
        builder: (context, selectedIndex) {
          return Scaffold(
            body: screens[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (v) => indexBloc.changeIndex(v),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: menuItems
                  .map(
                    (e) => BottomNavigationBarItem(
                        icon: e['icon'],
                        activeIcon: e['activeIcon'],
                        label: e['label']),
                  )
                  .toList(),
            ),
          );
        });
  }
}
