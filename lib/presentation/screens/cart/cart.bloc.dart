import 'package:bloc/bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/data/models/wishList/wish-list.model.dart';

class CartState {
  // List<CartItem>? selectedProducts = [];
  List<CartItem> cartItems = [];
  SizeEntity? selectedSize;
  bool isPriceUpdated;
  bool isAdded;

  int get totalPrice {
    int sum = 0;
    cartItems.forEach(
      (element) {
        sum += element.ourPrice ?? 0;
      },
    );
    // selectedProducts?.forEach((e) {
    //   sum += e.totalPrice ?? e.price;
    // });
    return sum;
  }

  CartItem toCartItem(ProductEntity product) {
    CartItem cartItem = CartItem(
      id: product.id,
      code: product.code,
      description_ru: product.description_ru,
      description_tm: product.description_tm,
      image: product.images?.first.getFullPathImage,
      // isSelected: product.isSelected,
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

  // int get productsSelectedCount {
  //   return selectedProducts?.length ?? 0;
  // }

  CartState({
    this.isAdded = false,
    required this.cartItems,
    this.selectedSize,
    this.isPriceUpdated = false,
    // required this.selectedProducts,
  });

  CartState copyWith({
    List<CartItem>? cartItems,
    SizeEntity? selectedSize,
    List<CartItem>? selectedProducts,
    bool? isPriceUpdated,
    bool? isAdded,
  }) {
    return CartState(
      isAdded: isAdded ?? this.isAdded,
      selectedSize: selectedSize ?? this.selectedSize,
      cartItems: cartItems ?? this.cartItems,
      isPriceUpdated: isPriceUpdated ?? this.isPriceUpdated,
      // selectedProducts: selectedProducts ?? this.selectedProducts,
    );
  }
}

class CartBloc extends Cubit<CartState> {
  CartBloc()
      : super(
          CartState(
            // selectedProducts: [],
            cartItems: [],
          ),
        );

  toSetSize(SizeEntity size) {
    emit(state.copyWith(selectedSize: size));
  }

  addToCart(ProductEntity product) {
    var item = state.toCartItem(product);
    item.selectedSize = state.selectedSize;

    var l = state.cartItems;
    if (l.contains(item)) {
      var existItem = l.firstWhere((element) => element.id == item.id);
      var val = existItem.defQuantity++;
      existItem.totalPrice = existItem.totalPrice == null
          ? existItem.price * val
          : existItem.totalPrice! * val;
    } else {
      l.add(item);
    }
    emit(
      state.copyWith(
        cartItems: l,
        selectedSize: null,
      ),
    );
  }

  addToCartFromWishList(CartItem item) {
    emit(state.copyWith(isAdded: false));
    if (!state.cartItems.contains(item)) {
      state.cartItems.add(item);
      // state.selectedProducts?.add(item);
    }
    emit(
      state.copyWith(
        cartItems: state.cartItems,
        // selectedProducts: state.selectedProducts,
        isAdded: true,
      ),
    );
  }

  changeProductQuantity(CartItem product, int v) {
    emit(state.copyWith(isPriceUpdated: false));
    if (state.cartItems.contains(product)) {
      var l = state.cartItems;
      state.cartItems[l.indexOf(product)].defQuantity = v;
      state.cartItems[l.indexOf(product)].totalPrice = product.price * v;
    }
    emit(
      state.copyWith(
        cartItems: state.cartItems,
        isPriceUpdated: true,
      ),
    );
  }

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

  remove(CartItem product) {
    state.cartItems.remove(product);
    // state.selectedProducts?.remove(product);
    emit(
      state.copyWith(
        cartItems: state.cartItems,
        // selectedProducts: state.selectedProducts,
      ),
    );
  }

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
}
