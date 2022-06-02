import 'package:bloc/bloc.dart';
import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/models/promotion/promotion.model.dart';
import 'package:yes/data/service/brand_service.dart';
import 'package:yes/data/service/promtion_service.dart';

enum BrandFetchingStatus { Idle, Loading, Error }
enum VipBrandsfetchingStatus { Idle, Loading, Error }

enum PromotionFetchingStatus { Idle, Loading, Error }

class HomeState {
  final BrandFetchingStatus? brandFetchingStatus;
  final PromotionFetchingStatus? promotionFetchingStatus;
  final List<Brand>? brands;
  final List<Promotion>? promotions;

  HomeState({
    this.brandFetchingStatus,
    this.promotionFetchingStatus,
    this.brands,
    this.promotions,
  });

  HomeState copyWith({
    List<Brand>? brands,
    List<Promotion>? promotions,
    BrandFetchingStatus? brandFetchingStatus,
    PromotionFetchingStatus? promotionFetchingStatus,
  }) {
    return HomeState(
        brandFetchingStatus: brandFetchingStatus ?? this.brandFetchingStatus,
        promotionFetchingStatus:
            promotionFetchingStatus ?? this.promotionFetchingStatus,
        brands: brands ?? this.brands,
        promotions: promotions ?? this.promotions);
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    Future.wait([
      fetchBrands(),
      fetchPromotions()
    ]);
  }

  Future<void> fetchBrands() async {
    emit(state.copyWith(brandFetchingStatus: BrandFetchingStatus.Loading));
    final res = await BrandService.fetchBrands();
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
}
