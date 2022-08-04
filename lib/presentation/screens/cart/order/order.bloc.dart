import 'package:bloc/bloc.dart';
import 'package:yes/data/models/order/create-order.model.dart';
import 'package:yes/data/service/order_service.dart';

enum CreateOrderStatus { idle, success, error, loading }

enum UpdateOrderStatus { idle, success, error, loading }

class OrderState {
  final CreateOrderStatus createOrderStatus;
  final UpdateOrderStatus updateOrderStatus;
  final CreateOrderDTO? order;

  OrderState({
    this.createOrderStatus = CreateOrderStatus.idle,
    this.updateOrderStatus = UpdateOrderStatus.idle,
    this.order,
  });

  OrderState copyWith({
    CreateOrderStatus? createOrderStatus,
    UpdateOrderStatus? updateOrderStatus,
    CreateOrderDTO? order,
  }) {
    return OrderState(
      createOrderStatus: createOrderStatus ?? this.createOrderStatus,
      updateOrderStatus: updateOrderStatus ?? this.updateOrderStatus,
      order: order ?? this.order,
    );
  }
}

class OrderBloc extends Cubit<OrderState> {
  OrderBloc() : super(OrderState());

  createOrder(CreateOrderDTO data) async {
    emit(
      state.copyWith(
        createOrderStatus: CreateOrderStatus.loading,
      ),
    );
    try {
      var res = await OrderService.cerateOrder(data);
      if (res.success == true) {
        emit(
          state.copyWith(
            createOrderStatus: CreateOrderStatus.success,
          ),
        );
      }
    } catch (_) {
      print(_);
      emit(
        state.copyWith(createOrderStatus: CreateOrderStatus.error),
      );
    }
  }
}
