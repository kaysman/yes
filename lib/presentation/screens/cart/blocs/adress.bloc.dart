import 'package:bloc/bloc.dart';
import 'package:yes/data/models/adress/adress.model.dart';
import 'package:yes/data/models/adress/create-adress.model.dart';
import 'package:yes/data/models/order/create-order.model.dart';
import 'package:yes/data/service/adress_service.dart';

enum CreateAdressStatus { idle, success, error, loading }

enum UpdateAdressStatus { idle, success, error, loading }

class AdressState {
  final CreateAdressStatus createAdressStatus;
  final UpdateAdressStatus updateAdressStatus;
  final AdressEntity? adress;

  AdressState({
    this.adress,
    this.createAdressStatus = CreateAdressStatus.idle,
    this.updateAdressStatus = UpdateAdressStatus.idle,
  });

  AdressState copyWith({
    CreateAdressStatus? createAdressStatus,
    UpdateAdressStatus? updateAdressStatus,
    AdressEntity? adress,
  }) {
    return AdressState(
      createAdressStatus: createAdressStatus ?? this.createAdressStatus,
      updateAdressStatus: updateAdressStatus ?? this.updateAdressStatus,
      adress: adress ?? this.adress,
    );
  }
}

class AdressBloc extends Cubit<AdressState> {
  AdressBloc() : super(AdressState());

  createAdress(CreateAddressDTO data) async {
    emit(
      state.copyWith(
        createAdressStatus: CreateAdressStatus.loading,
      ),
    );
    try {
      var res = await AdressService.cerateAdress(data);
      if (res.success == true) {
        var adress = AdressEntity.fromJson(res.data);
        emit(
          state.copyWith(
            adress: adress,
            createAdressStatus: CreateAdressStatus.success,
          ),
        );
      }
    } catch (_) {
      print(_);
      emit(
        state.copyWith(createAdressStatus: CreateAdressStatus.error),
      );
    }
  }
}
