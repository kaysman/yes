import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/filter/filter.entity.model.dart';
import 'package:yes/data/models/product%20-new/pagination.model.dart';
import 'package:yes/data/service/filter_service.dart';

class FilterBloc extends Cubit<FilterState> {
  FilterBloc() : super(FilterState());

  getAllFilters({
    PaginationDTO? filter,
    bool subtle = false,
  }) async {
    emit(
      state.copyWith(
        listingStatus:
            subtle ? FilterListStatus.silentLoading : FilterListStatus.loading,
      ),
    );

    if (filter == null) {
      filter = PaginationDTO();
    }
    try {
      var res = await FilterService.getFilters(filter.toJson());
      emit(state.copyWith(filters: res, listingStatus: FilterListStatus.idle));
    } catch (_) {
      print(_);
      emit(state.copyWith(listingStatus: FilterListStatus.error));
    }
  }
}

enum FilterListStatus { idle, loading, error, silentLoading }

class FilterState {
  final List<FilterEntity>? filters;
  final FilterListStatus? listingStatus;

  FilterState({
    this.filters,
    this.listingStatus = FilterListStatus.idle,
  });

  FilterState copyWith({
    List<FilterEntity>? filters,
    FilterListStatus? listingStatus,
  }) {
    return FilterState(
      filters: filters ?? this.filters,
      listingStatus: listingStatus ?? this.listingStatus,
    );
  }
}
