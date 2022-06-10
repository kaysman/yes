import 'package:bloc/bloc.dart';
import 'package:yes/data/models/product/product.model.dart';

class ShoppingBagState {
  List<Product> products = [];
  List<Product> selectedProducts = [];
  int? productQuantityVal;
  bool isPriceUpdated;

  int get totalPrice {
    int sum = 0;
    selectedProducts.forEach((e) {
      sum += e.price!;
    });
    return sum;
  }

  int get productsCount {
    return products.length;
  }

  int get productsSelectedCount {
    return selectedProducts.length;
  }

  ShoppingBagState({
    this.isPriceUpdated = false,
    required this.products,
    required this.selectedProducts,
    this.productQuantityVal,
  });

  ShoppingBagState copyWith({
    List<Product>? products,
    List<Product>? selectedProducts,
    int? productQuantityVal,
    bool? isPriceUpdated,
  }) {
    return ShoppingBagState(
      isPriceUpdated: isPriceUpdated ?? this.isPriceUpdated,
      productQuantityVal: productQuantityVal ?? this.productQuantityVal,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      products: products ?? this.products,
    );
  }
}

class ShoppingBagBloc extends Cubit<ShoppingBagState> {
  ShoppingBagBloc()
      : super(ShoppingBagState(products: [], selectedProducts: []));

  addToCart(Product product) {
    state.products.add(product);
    state.selectedProducts.add(product);
    print(state.products);
    emit(
      state.copyWith(
          products: state.products, selectedProducts: state.selectedProducts),
    );
  }
  

  changeProductQuantity(Product product, int q) {
    emit(state.copyWith(isPriceUpdated: false));
    state.productQuantityVal = q;
    state.products.firstWhere((e) => e.id == product.id).price! *q;
    emit(
      state.copyWith(
        products: state.products,
        productQuantityVal: state.productQuantityVal,
        isPriceUpdated: true
      ));
  }

  // setQuantity(int val) {
  //   emit(state.copyWith(productQuantityVal: state.productQuantityVal));
  // }

  selectOrUnSelectAllproducts(bool v) {
    var _products = state.products;
    if (v) {
      // state.selectedProducts.forEach((e) => e.isSelected = v);
      state.products.forEach((e) => e.isSelected = v);
      state.selectedProducts.addAll(_products);
    } else {
      state.products.forEach((e) => e.isSelected = v);
      // state.selectedProducts.forEach((e) => e.isSelected = v);
      state.selectedProducts.clear();
    }

    emit(state.copyWith(selectedProducts: state.selectedProducts));
  }

  selectProduct(Product product, bool value) {
    if (!state.selectedProducts.contains(product)) {
      state.products.firstWhere((e) => e.id == product.id).isSelected = !value;
      state.selectedProducts.add(product);
      state.selectedProducts.firstWhere((e) => e.id == product.id).isSelected =
          value;
    } else {
      state.selectedProducts.firstWhere((e) => e.id == product.id).isSelected =
          value;
      state.products.firstWhere((e) => e.id == product.id).isSelected = value;
      state.selectedProducts.remove(product);
    }
    emit(state.copyWith(
        selectedProducts: state.selectedProducts, products: state.products));
  }

  remove(Product product) {
    state.products.remove(product);
    state.selectedProducts.remove(product);
    emit(state.copyWith(
        products: state.products, selectedProducts: state.selectedProducts));
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
