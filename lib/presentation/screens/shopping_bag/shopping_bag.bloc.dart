import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yes/data/models/product/product.model.dart';

class ShoppingBagState extends Equatable {
  List<Product> products = [];
  List<Product> selectedProducts = [];
  final int? productCount;
  int totalPrice;
  bool isAdded;
  bool isUpdated;

  ShoppingBagState(
      {this.isUpdated = false,
      this.totalPrice = 0,
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
    int? totalPrice,
  }) {
    return ShoppingBagState(
      isUpdated: isUpdated ?? this.isUpdated,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      totalPrice: totalPrice ?? this.totalPrice,
      isAdded: isAdded ?? this.isAdded,
      products: products ?? this.products,
      productCount: productCount ?? this.productCount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [products, isAdded, products, productCount, selectedProducts, isUpdated];
}

class ShoppingBagBloc extends Cubit<ShoppingBagState> {
  ShoppingBagBloc()
      : super(ShoppingBagState(products: [], selectedProducts: []));

  addToCart(Product product) {
    state.products.add(product);
    state.totalPrice += product.price!;
    print(state.products);
    emit(
      state.copyWith(
          products: state.products,
          productCount: state.products.length,
          totalPrice: state.totalPrice),
    );
  }

  // addToSelected(Product product, ){
  //   if(){

  //   }
  // }

  selectProduct(int index, Product product) {
    emit(state.copyWith(isAdded: false));
    state.products[index].isSelected = !product.isSelected;
    // state.selectedProducts.add(product);
    // print(state.selectedProducts.indexOf(product) > -1);
    emit(state.copyWith(isAdded: true));
  }

  remove(Product product) {
    emit(state.copyWith(isUpdated: false));
    state.products.where((element) => element.id != product.id);
    emit(state.copyWith(isUpdated: true));
  }
}
