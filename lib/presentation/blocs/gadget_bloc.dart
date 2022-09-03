import 'package:bloc/bloc.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import 'package:yes/data/service/gadget_service.dart';

enum GadgetFetchingStatus { Idle, Loading, Error }

class GadgetState {
  final List<GadgetEntity>? gadgets;
  final List<GadgetEntity>? homeGadgets;
  final List<GadgetEntity>? categoryGadgets;
  final GadgetFetchingStatus gadgetFetchingStatus;

  GadgetState({
    this.gadgets,
    this.homeGadgets,
    this.categoryGadgets,
    this.gadgetFetchingStatus = GadgetFetchingStatus.Idle,
  });

  GadgetState copyWith({
    List<GadgetEntity>? gadgets,
    GadgetFetchingStatus? gadgetFetchingStatus,
    List<GadgetEntity>? homeGadgets,
    List<GadgetEntity>? categoryGadgets,
  }) {
    return GadgetState(
      gadgets: gadgets ?? this.gadgets,
      gadgetFetchingStatus: gadgetFetchingStatus ?? this.gadgetFetchingStatus,
      categoryGadgets: categoryGadgets ?? this.categoryGadgets,
      homeGadgets: homeGadgets ?? this.homeGadgets,
    );
  }
}

class GadgetBloc extends Cubit<GadgetState> {
  GadgetBloc() : super(GadgetState()) {
    fetchGadgets();
  }

  Future<void> fetchGadgets() async {
    try {
      emit(state.copyWith(gadgetFetchingStatus: GadgetFetchingStatus.Loading));
      final res = await GadgetService.getAllGadgets();
      var homeGadgets = res
          .where(
            (e) =>
                e.location == GadgetLocation.HOME.name &&
                e.status == GadgetStatus.ACTIVE.name,
          )
          .toList();
      var categoryGadgets = res
          .where(
            (e) =>
                e.location == GadgetLocation.CATEGORY.name &&
                e.status == GadgetStatus.ACTIVE.name,
          )
          .toList();
      emit(state.copyWith(
        gadgetFetchingStatus: GadgetFetchingStatus.Idle,
        gadgets: res,
        categoryGadgets: categoryGadgets,
        homeGadgets: homeGadgets,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(gadgetFetchingStatus: GadgetFetchingStatus.Error));
    }
  }
}
