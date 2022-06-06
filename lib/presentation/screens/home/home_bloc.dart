import 'package:bloc/bloc.dart';
import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/data/models/product/products.model.dart';
import 'package:yes/data/models/promotion/promotion.model.dart';
import 'package:yes/data/service/brand_service.dart';
import 'package:yes/data/service/promtion_service.dart';

enum BrandFetchingStatus { Idle, Loading, Error }

enum VipBrandsfetchingStatus { Idle, Loading, Error }

enum PromotionFetchingStatus { Idle, Loading, Error }

enum FetchPromotionsByIdStatus { Idle, Loading, Error }

class HomeState {
  final BrandFetchingStatus? brandFetchingStatus;
  final PromotionFetchingStatus? promotionFetchingStatus;
  final List<Brand>? brands;
  final List<Promotion>? promotions;
  final List<Product>? products;

  HomeState(
      {this.brandFetchingStatus,
      this.promotionFetchingStatus,
      this.brands,
      this.promotions,
      this.products});

  HomeState copyWith({
    List<Brand>? brands,
    List<Promotion>? promotions,
    List<Product>? products,
    BrandFetchingStatus? brandFetchingStatus,
    PromotionFetchingStatus? promotionFetchingStatus,
  }) {
    return HomeState(
        brandFetchingStatus: brandFetchingStatus ?? this.brandFetchingStatus,
        promotionFetchingStatus:
            promotionFetchingStatus ?? this.promotionFetchingStatus,
        products: products ?? this.products,
        brands: brands ?? this.brands,
        promotions: promotions ?? this.promotions);
  }
}

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    Future.wait([fetchVipBrands(), fetchPromotions()]);
  }

  Future<void> fetchVipBrands() async {
    emit(state.copyWith(brandFetchingStatus: BrandFetchingStatus.Loading));
    final res = await BrandService.fetchVipBrands();
    emit(state.copyWith(
        brandFetchingStatus: BrandFetchingStatus.Idle, brands: res));
  }

  Future<void> fetchPromotions() async {
    emit(state.copyWith(
        promotionFetchingStatus: PromotionFetchingStatus.Loading));
    final res = await PromotionService.fetchPromotions();
    emit(state.copyWith(
        promotionFetchingStatus: PromotionFetchingStatus.Idle,
        promotions: res));
  }

  Future<void> fetchPromotionsById(int? id) async {
    final res = await PromotionService.fetchPromotionProducts(id);
    emit(state.copyWith(products: res));
  }
}
