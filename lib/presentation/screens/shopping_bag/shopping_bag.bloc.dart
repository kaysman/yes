import 'package:bloc/bloc.dart';
import 'package:yes/data/models/cart/cart.model.dart';
import 'package:yes/data/models/product/product.model.dart';

class ShoppingBagState {
  List<Product> products = [];
  List<CartItem>? selectedProducts = [];
  CartItem? cartItem;
  List<CartItem> cartItems = [];
  int? productQuantityVal;
  bool isPriceUpdated;

  int get totalPrice {
    int sum = 0;
    selectedProducts?.forEach((e) {
      sum += e.price ?? 0;
    });
    return sum;
  }

  CartItem toCartItem(Product product) {
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
      price: product.price,
    );
    return cartItem;
  }

  int get productsCount {
    return cartItems.length;
  }

  int get productsSelectedCount {
    return selectedProducts?.length ?? 0;
  }

  ShoppingBagState({
    required this.cartItems,
    this.cartItem,
    this.isPriceUpdated = false,
    required this.products,
    required this.selectedProducts,
    this.productQuantityVal,
  });

  ShoppingBagState copyWith({
    List<Product>? products,
    List<CartItem>? cartItems,
    List<CartItem>? selectedProducts,
    CartItem? cartItem,
    int? productQuantityVal,
    bool? isPriceUpdated,
  }) {
    return ShoppingBagState(
      cartItem: cartItem ?? this.cartItem,
      cartItems: cartItems ?? this.cartItems,
      isPriceUpdated: isPriceUpdated ?? this.isPriceUpdated,
      productQuantityVal: productQuantityVal ?? this.productQuantityVal,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      products: products ?? this.products,
    );
  }
}

class ShoppingBagBloc extends Cubit<ShoppingBagState> {
  ShoppingBagBloc()
      : super(
          ShoppingBagState(
            products: [],
            selectedProducts: [],
            cartItems: [],
          ),
        );

  addToCart(Product product) {
    // var item = state.toCartItem(product);
    // // state.
    // // var l = state.cartItems;
    // l.add(item);
    // print(l);
    // emit(
    //   state.copyWith(
    //     cartItem: item,
    //     cartItems: l,
    //     selectedProducts: state.selectedProducts,
    //   ),
    // );
  }

  changeProductQuantity(CartItem product, int q) {
    emit(state.copyWith(isPriceUpdated: false));
    state.cartItem?.defQuantity = q;
    state.cartItem?.totalPrice = (product.price ?? 0) * q;
    emit(
      state.copyWith(
        cartItem: state.cartItem,
        isPriceUpdated: true,
      ),
    );
  }

  setQuantity(int val) {
    state.cartItem?.defQuantity = val;
    emit(state.copyWith(cartItem: state.cartItem));
  }

  selectOrUnSelectAllproducts(bool v) {
    var _products = state.cartItems;
    if (v) {
      state.cartItems.forEach((e) => e.isSelected = v);
      state.selectedProducts?.addAll(_products);
    } else {
      state.cartItems.forEach((e) => e.isSelected = v);
      state.selectedProducts?.clear();
    }

    emit(state.copyWith(selectedProducts: state.selectedProducts));
  }

  selectProduct(CartItem product, bool value) {
    if (!state.selectedProducts!.contains(product)) {
      state.cartItems.firstWhere((e) => e.id == product.id).isSelected = !value;
      state.selectedProducts?.add(product);
      state.selectedProducts?.firstWhere((e) => e.id == product.id).isSelected =
          value;
    } else {
      state.selectedProducts?.firstWhere((e) => e.id == product.id).isSelected =
          value;
      state.cartItems.firstWhere((e) => e.id == product.id).isSelected = value;
      state.selectedProducts?.remove(product);
    }
    emit(state.copyWith(
        selectedProducts: state.selectedProducts, products: state.products));
  }

  remove(CartItem product) {
    state.cartItems.remove(product);
    state.selectedProducts?.remove(product);
    emit(
      state.copyWith(
        cartItems: state.cartItems,
        selectedProducts: state.selectedProducts,
      ),
    );
  }

  updateProducts() {
    List<Product> products = [];
    state.products.forEach((product) {
      var map = product.toJson();
      map['id'] = state.products.indexOf(product);
      map['name_tm'] =
          product.name_tm! + state.products.indexOf(product).toString();
      products.add(Product.fromJson(map));
    });
    emit(state.copyWith(products: products));
  }
}
