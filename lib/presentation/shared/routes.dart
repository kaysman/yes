import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/cart/cart_screen.dart';
import 'package:yes/presentation/screens/cart/widgets/user_adress.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/wish_grid_list.dart';
import 'package:yes/presentation/screens/home/products/products_screen.dart';
import 'package:yes/presentation/screens/home/search/serach.dart';
import 'package:yes/presentation/screens/home/widgets/vip_categories.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';

import '../screens/home/product_detail/product_detail_screen.dart';

List<Route<dynamic>> onGenerateInitialRoutes(String name) {
  switch (name) {
    case IndexScreen.routeName:
      return [
        MaterialPageRoute(
          builder: (_) => IndexScreen(),
        )
      ];
    case CartScreen.routeName:
      return [
        MaterialPageRoute(
          builder: (_) => CartScreen(),
        )
      ];
    // case SubCategoryList.routeName:
    //   return [
    //     MaterialPageRoute(
    //       builder: (_) => SubCategoryList(),
    //     )
    //   ];

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
    case AdressCreateSheet.routeName:
      return MaterialPageRoute(
        builder: (_) => AdressCreateSheet(),
      );
    case SubCategoryList.routeName:
      return MaterialPageRoute(builder: (_) {
        var args = settings.arguments as Map<String, dynamic>;
        return SubCategoryList(
          subCategories: args['subCategories'],
        );
      });
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
          return ProductsScreen(
              // promotionId: args['promotionId'],
              );
          // var args = settings.arguments as Map<String, dynamic>;
          // switch (args.keys.first) {
          //   case "promotionId":

          //   default:
          //     return SizedBox();
          // }
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
