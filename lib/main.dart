import 'package:flutter/material.dart';
import 'package:yes_demo/global_providers/brand_providers.dart';
import 'package:yes_demo/global_providers/promotion_provider.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'global_providers/category_provider.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/category/category_screen.dart';
import 'screens/home/home.dart';
import 'screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: ((_) => CategoryProvider())),
        ChangeNotifierProvider<BrandProvider>(
          create: ((_) => BrandProvider()),
        ),
        ChangeNotifierProvider<PromotionProvider>(
          create: ((_) => PromotionProvider()),
        ),
      ],
      builder: (context, child) => MyApp(),
    ));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentindex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 50,
          iconTheme: IconThemeData(color: text1Color),
          titleTextStyle: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currentindex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (i) => setState(() => currentindex = i),
            currentIndex: currentindex,
            unselectedItemColor: text1Color,
            selectedItemColor: primaryColor,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.category_rounded),
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_bag),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Shopping Bag',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}

// enum CurrentScreen { home, categories, shoppingBag, profile }
