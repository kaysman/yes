import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/market-new/market.model.dart';
import 'package:yes/data/models/product%20-new/pagination.model.dart';
import 'package:yes/data/service/market.service.dart';

class MarketBloc extends Cubit<MarketState> {
  MarketBloc() : super(MarketState());

  getAllMarkets({PaginationDTO? filter, bool subtle = false}) async {
    emit(state.copyWith(
      listingStatus:
          subtle ? MarketListStatus.silentLoading : MarketListStatus.loading,
    ));
    if (filter == null) {
      filter = PaginationDTO();
    }
    try {
      var res = await MarketService.getMarkets(queryParams: filter.toJson());

      emit(state.copyWith(
        markets: res,
        listingStatus: MarketListStatus.idle,
      ));
    } catch (_) {
      print(_);
      emit(state.copyWith(listingStatus: MarketListStatus.error));
    }
  }
}

enum MarketListStatus {
  idle,
  loading,
  error,
  silentLoading,
}

class MarketState {
  final List<MarketEntity>? markets;
  final MarketListStatus? listingStatus;

  MarketState({
    this.markets,
    this.listingStatus = MarketListStatus.idle,
  });

  MarketState copyWith({
    List<MarketEntity>? markets,
    MarketListStatus? listingStatus,
  }) {
    return MarketState(
      markets: markets ?? this.markets,
      listingStatus: listingStatus ?? this.listingStatus,
    );
  }
}
