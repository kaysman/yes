import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';

import '../../shared/helpers.dart';
import '../category/category_screen.dart';
import '../profile/profile_screen.dart';
import '../shopping_bag/shopping_bag_screen.dart';

class YESApp extends StatefulWidget {
  const YESApp({Key? key}) : super(key: key);

  @override
  State<YESApp> createState() => _YESAppState();
}

class _YESAppState extends State<YESApp> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        onTap: (int index) => setState(() => currentIndex = index),
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
  }
}
