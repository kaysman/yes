import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/brand-new/brand.model.dart';
import 'package:yes/data/models/product%20-new/pagination.model.dart';
import 'package:yes/data/service/brand_service.dart';

class BrandBloc extends Cubit<BrandState> {
  BrandBloc() : super(BrandState());

  getAllBrands({
    PaginationDTO? filter,
    bool subtle = false,
  }) async {
    emit(state.copyWith(
      listingStatus:
          subtle ? BrandListStatus.silentLoading : BrandListStatus.loading,
    ));
    if (filter == null) {
      filter = PaginationDTO();
    }
    try {
      var res = await BrandService.getBrands(queryParams: filter.toJson());
      emit(state.copyWith(
        brands: res,
        listingStatus: BrandListStatus.idle,
      ));
    } catch (_) {
      print(_);
      emit(state.copyWith(listingStatus: BrandListStatus.error));
    }
  }
}

enum BrandListStatus { idle, loading, error, silentLoading }

class BrandState {
  final List<BrandEntity>? brands;
  final BrandListStatus? listingStatus;

  BrandState({
    this.brands,
    this.listingStatus = BrandListStatus.idle,
  });

  BrandState copyWith({
    List<BrandEntity>? brands,
    BrandListStatus? listingStatus,
  }) {
    return BrandState(
      brands: brands ?? this.brands,
      listingStatus: listingStatus ?? this.listingStatus,
    );
  }
}
