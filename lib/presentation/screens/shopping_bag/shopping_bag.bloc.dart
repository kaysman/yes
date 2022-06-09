import 'package:bloc/bloc.dart';
import 'package:yes/data/models/product/product.model.dart';

class ShoppingBagState {
  List<Product> products = [];
  List<Product> selectedProducts = [];
  final int? productCount;
  bool isAdded;
  bool isUpdated;

  int get totalPrice {
    int sum = 0;
    products.forEach((e) {
      sum += e.price!;
    });
    return sum;
  }

  ShoppingBagState(
      {this.isUpdated = false,
      required this.products,
      this.isAdded = false,
      this.productCount,
      required this.selectedProducts});

  ShoppingBagState copyWith({
    List<Product>? products,
    List<Product>? selectedProducts,
    bool? isAdded,
    bool? isUpdated,
    int? productCount,
  }) {
    return ShoppingBagState(
      isUpdated: isUpdated ?? this.isUpdated,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      isAdded: isAdded ?? this.isAdded,
      products: products ?? this.products,
      productCount: productCount ?? this.productCount,
    );
  }
}

class ShoppingBagBloc extends Cubit<ShoppingBagState> {
  ShoppingBagBloc()
      : super(ShoppingBagState(products: [], selectedProducts: []));

  addToCart(Product product) {
    state.products.add(product);
    print(state.products);
    emit(
      state.copyWith(
        products: state.products,
        productCount: state.products.length,
      ),
    );
  }

  // addToSelected(Product product, ){
  //   if(){

  //   }
  // }

  selectProduct(Product product, bool value) {
    // emit(state.copyWith(isAdded: false));
    state.products.firstWhere((e) => e.id == product.id).isSelected = value;
    print(state.products.firstWhere((e) => e.id == product.id));
    emit(state.copyWith(products: state.products));
  }

  remove(Product product) {
    // emit(state.copyWith(isUpdated: false));
    state.products.remove(product);
    print(state.products.firstWhere((e) => e.id == product.id));
    emit(state.copyWith(products: state.products));
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
