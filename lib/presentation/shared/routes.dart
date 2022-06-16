import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/products/products_screen.dart';
import 'package:yes/presentation/screens/home/search/serach.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';
import 'package:yes/presentation/screens/shopping_bag/widgets/wishlist/wish_grid_list.dart';

import '../screens/home/product_detail/product_detail_screen.dart';
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
    case ProductDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          var args = settings.arguments as Map<String, dynamic>;
          switch (args.keys.first) {
            case 'product':
              return ProductDetailScreen(
                product: args['product'],
              );
            default:
              return SizedBox();
          }
        },
      );
    case ProductsScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          var args = settings.arguments as Map<String, dynamic>;
          switch (args.keys.first) {
            case "promotionId":
              return ProductsScreen(
                promotionId: args['promotionId'],
              );
            default:
              return SizedBox();
          }
        },
      );
    case WishGridList.routeName:
      return MaterialPageRoute(
        builder: (_) {
          var args = settings.arguments as Map<String, dynamic>;
          return WishGridList(
            products: args['products'],
            categories: args['categories'],
            filteredList: args['filteredList'],
          );
        },
      );
    default:
      return MaterialPageRoute(
        builder: (_) => IndexScreen(),
      );
  }
}
