import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/search/serach.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';

import '../screens/shopping_bag/shopping_bag_screen.dart';

List<Route<dynamic>> onGenerateInitialRoutes(String name) {
  switch (name) {
    case IndexScreen.routeName:
      return [
        MaterialPageRoute(
          builder: (_) => IndexScreen(),
        )
      ];
    default:
      return [
        MaterialPageRoute(
          builder: (_) => IndexScreen(),
        )
      ];
  }
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IndexScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => IndexScreen(),
      );
    case SearchBar.routeName:
      return MaterialPageRoute(
        builder: (_) => SearchBar(),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => CartScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => IndexScreen(),
      );
  }
}
