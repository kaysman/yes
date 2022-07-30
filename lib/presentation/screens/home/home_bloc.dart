import 'package:bloc/bloc.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/data/service/gadget_service.dart';

enum GadgetFetchingStatus { Idle, Loading, Error }

class HomeState {
  final List<GadgetEntity>? gadgets;
  final GadgetFetchingStatus gadgetFetchingStatus;

  HomeState({
    this.gadgets,
    this.gadgetFetchingStatus = GadgetFetchingStatus.Idle,
  });

  HomeState copyWith(
      {List<GadgetEntity>? gadgets,
      GadgetFetchingStatus? gadgetFetchingStatus}) {
    return HomeState(
      gadgets: gadgets ?? this.gadgets,
      gadgetFetchingStatus: gadgetFetchingStatus ?? this.gadgetFetchingStatus,
    );
  }
}

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    fetchGadgets();
  }

  Future<void> fetchGadgets() async {
    try {
      emit(state.copyWith(gadgetFetchingStatus: GadgetFetchingStatus.Loading));
      final res = await GadgetService.getAllGadgets();
      emit(state.copyWith(
        gadgetFetchingStatus: GadgetFetchingStatus.Idle,
        gadgets: res,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(gadgetFetchingStatus: GadgetFetchingStatus.Error));
    }
  }
}
