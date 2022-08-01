import 'package:bloc/bloc.dart';
import 'package:yes/data/models/wishList/wish-list.model.dart';
import 'package:yes/presentation/screens/shopping_bag/shopping_bag.bloc.dart';

import '../../../../../../data/models/category/category.model.dart';

class WishListState {
  List<WishListItem> wishListItems = [];
  List<Category> categories = [];
  List<WishListItem> filteredList = [];
  // bool isMovedToCard;

  // WishListItem toWishListItem(Product product) {
  //   WishListItem wishListItem = WishListItem(
  //     id: product.id,
  //     code: product.code,
  //     description_ru: product.description_ru,
  //     description_tm: product.description_tm,
  //     image: product.image,
  //     isSelected: product.isSelected,
  //     name_ru: product.name_ru,
  //     name_tm: product.name_tm,
  //     quantity: product.quantity,
  //     price: product.price,
  //     category: product.category,
  //   );
  //   return wishListItem;
  // }

  WishListState({
    // this.isMovedToCard = false,
    required this.categories,
    required this.wishListItems,
    required this.filteredList,
  });

  WishListState copyWith({
    List<WishListItem>? wishListItems,
    List<WishListItem>? filteredList,
    List<Category>? categories,
    // bool? isMovedToCard,
  }) {
    return WishListState(
      // isMovedToCard: isMovedToCard ?? this.isMovedToCard,
      filteredList: filteredList ?? this.filteredList,
      categories: categories ?? this.categories,
      wishListItems: wishListItems ?? this.wishListItems,
    );
  }
}

class WishListBloc extends Cubit<WishListState> {
  final ShoppingBagBloc shoppingBagBloc;
  WishListBloc(this.shoppingBagBloc)
      : super(
          WishListState(
            filteredList: [],
            categories: [Category(id: 0, title_tm: 'All')],
            wishListItems: [],
          ),
        );

  // addToWishList(Product product) {
  //   var item = state.toWishListItem(product);
  //   var l = state.wishListItems;
  //   var category = item.category;
  //   var categories = state.categories;
  //   if (!l.contains(item)) {
  //     l.add(item);
  //   }

  //   if (!categories.contains(category)) {
  //     categories.add(category!);
  //   }
  //   var filterList = state.filteredList;
  //   if (filterList.isNotEmpty) {
  //     filterList = l.where((e) => e.category == category).toList();
  //   }
  //   emit(state.copyWith(
  //       wishListItems: l, categories: categories, filteredList: filterList));
  // }

  onSelectCategory(int i) {
    var categories = state.categories;
    var category = categories[i];
    var l = state.wishListItems;
    var filterList = state.filteredList;
    filterList = l.where((e) => e.category == category).toList();
    emit(state.copyWith(wishListItems: l, filteredList: filterList));
  }

  moveToBag(int? id) async {
    var item = state.wishListItems.firstWhere(
      (element) => element.id == id,
      orElse: () => WishListItem(id: 0),
    );
    var cartItem = shoppingBagBloc.state.toCartItemFromWishList(item);
    await shoppingBagBloc.addToCartFromWishList(cartItem);
    if (shoppingBagBloc.state.isAdded) {
      await state.wishListItems.remove(item);
    }
    emit(
      state.copyWith(wishListItems: state.wishListItems),
    );
  }
}
