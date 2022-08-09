import 'package:bloc/bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/data/models/wishList/wish-list.model.dart';

class CartState {
  List<CartItem> cartItems = [];
  int addToCartTime;

  int get totalPrice {
    int sum = 0;
    cartItems.forEach(
      (element) {
        sum += element.price;
      },
    );
    return sum;
  }

  CartItem toCartItem(ProductEntity product, {List<SizeEntity>? sizes}) {
    CartItem cartItem = CartItem(
      selectedSizes: sizes == null ? [] : sizes,
      id: product.id,
      code: product.code,
      description_ru: product.description_ru,
      description_tm: product.description_tm,
      image: product.images?.first.getFullPathImage,
      name_ru: product.name_ru,
      sizes: product.sizes,
      name_tm: product.name_tm,
      quantity: product.quantity,
      price: product.ourPrice ?? 0,
    );
    return cartItem;
  }

  CartItem toCartItemFromWishList(WishListItem product) {
    CartItem cartItem = CartItem(
      selectedSizes: [],
      id: product.id,
      code: product.code,
      description_ru: product.description_ru,
      description_tm: product.description_tm,
      image: product.image,
      isSelected: product.isSelected,
      name_ru: product.name_ru,
      name_tm: product.name_tm,
      quantity: product.quantity,
      price: product.price ?? 0,
    );
    return cartItem;
  }

  int get productsCount {
    return cartItems.length;
  }

  CartState({
    required this.cartItems,
    this.addToCartTime = 0,
  });

  CartState copyWith({
    List<CartItem>? cartItems,
    List<CartItem>? selectedProducts,
    CartItem? selectedCartItem,
    bool? isPriceUpdated,
    bool? isAdded,
    int? addToCartTime,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      addToCartTime: addToCartTime ?? this.addToCartTime,
    );
  }
}

class CartBloc extends Cubit<CartState> {
  CartBloc() : super(CartState(cartItems: []));

  bool? checkIfHasItem({ProductEntity? product, CartItem? cartItem}) {
    var item = cartItem == null ? state.toCartItem(product!) : cartItem;
    if (state.cartItems.isNotEmpty) {
      var hasItem = state.cartItems.firstWhere(
        (el) => el.id == item.id,
        orElse: () => CartItem(id: 0, price: 0, selectedSizes: []),
      );
      return item.id == hasItem.id;
    }

    return null;
  }

  List<SizeEntity>? checkIfHasItemsSizes(
      {ProductEntity? product, CartItem? cartItem}) {
    List<SizeEntity> hasSizes = [];
    var item = cartItem == null ? state.toCartItem(product!) : cartItem;
    if (state.cartItems.isNotEmpty) {
      var hasItemSizes = state.cartItems
          .where(
            (el) => el.id == item.id,
          )
          .toList();

      for (var item in hasItemSizes) {
        hasSizes.addAll(item.selectedSizes);
      }

      return hasSizes;
    }

    return null;
  }

  addToCart(CartItem item, SizeEntity size) {
    item.selectedSize = size;
    item.selectedSizes.add(size);

    if (state.cartItems.contains(item)) {
      var existItem =
          state.cartItems.firstWhere((element) => element.id == item.id);
      var val = existItem.defQuantity++;
      existItem.price = existItem.price * val;
    } else {
      state.cartItems.add(item);
    }

    emit(
      state.copyWith(
        cartItems: state.cartItems,
      ),
    );
  }

  // addToCartFromWishList(CartItem item) {
  //   emit(state.copyWith(isAdded: false));
  //   if (!state.cartItems.contains(item)) {
  //     state.cartItems.add(item);
  //   }
  //   emit(
  //     state.copyWith(
  //       cartItems: state.cartItems,
  //       isAdded: true,
  //     ),
  //   );
  // }

  remove(CartItem item) {
    state.cartItems.remove(item);
    emit(state.copyWith(cartItems: state.cartItems));
  }

  resetCart() {
    emit(
      state.copyWith(
        cartItems: [],
        addToCartTime: 1,
      ),
    );
  }

  updateItemCountAndSize(CartItem item, int? v, SizeEntity? size) {
    var isHas = checkIfHasItem(cartItem: item);

    if (isHas == true) {
      var list = state.cartItems;
      var existItem = state.cartItems[list.indexOf(item)];
      // count update
      if (v != null) {
        existItem.defQuantity = v;
        existItem.price = item.price * v;
      }

      // size update
      if (size != null) {
        existItem.selectedSizes.remove(existItem.selectedSize);
        existItem.selectedSize = size;
        existItem.selectedSizes.add(size);
      }
      emit(
        state.copyWith(
          cartItems: state.cartItems,
        ),
      );
    }
  }

  addToCartTime({int? time}) {
    if (time == null) {
      state.addToCartTime++;
    } else {
      state.addToCartTime = 1;
    }

    print(state.addToCartTime);

    emit(state.copyWith(addToCartTime: state.addToCartTime));
  }

  // toSetSize(SizeEntity size) {
  //   print('---in bloc----');
  //   state.selectedCartItem?.selectedSize = size;
  //   state.selectedCartItem?.selectedSizes.add(size);

  //   emit(
  //     state.copyWith(
  //       selectedCartItem: state.selectedCartItem,
  //     ),
  //   );
  // }

  // bool? checkIfHasSize(CartItem item, SizeEntity? size) {
  //   var has = checkIfHasItem(cartItem: item);
  //   if (item.selectedSizes.isNotEmpty && has == true) {
  //     return item.selectedSizes
  //             .firstWhere(
  //               (el) => el.id == size?.id,
  //               orElse: () => SizeEntity(),
  //             )
  //             .id ==
  //         size?.id;
  //   }

  //   return null;
  // }

  // selectOrUnSelectAllproducts(bool v) {
  //   var _products = state.cartItems;
  //   if (v) {
  //     state.cartItems.forEach((e) => e.isSelected = v);
  //     state.selectedProducts?.addAll(_products);
  //   } else {
  //     state.cartItems.forEach((e) => e.isSelected = v);
  //     state.selectedProducts?.clear();
  //   }
  //   emit(state.copyWith(selectedProducts: state.selectedProducts));
  // }

  // selectProduct(CartItem product, bool value) {
  //   if (!state.selectedProducts!.contains(product)) {
  //     state.cartItems.firstWhere((e) => e.id == product.id).isSelected = !value;
  //     state.selectedProducts?.add(product);
  //     state.selectedProducts?.firstWhere((e) => e.id == product.id).isSelected =
  //         value;
  //   } else {
  //     state.selectedProducts?.firstWhere((e) => e.id == product.id).isSelected =
  //         value;
  //     state.cartItems.firstWhere((e) => e.id == product.id).isSelected = value;
  //     state.selectedProducts?.remove(product);
  //   }
  //   emit(state.copyWith(
  //     selectedProducts: state.selectedProducts,
  //   ));
  // }

  // updateProducts() {
  //   List<Product> products = [];
  //   state.products.forEach((product) {
  //     var map = product.toJson();
  //     map['id'] = state.products.indexOf(product);
  //     map['name_tm'] =
  //         product.name_tm! + state.products.indexOf(product).toString();
  //     products.add(Product.fromJson(map));
  //   });
  //   emit(state.copyWith(products: products));
  // }
  // }
}
