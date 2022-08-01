import 'package:yes/data/models/order/create-order-item.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create-order.model.g.dart';

@JsonSerializable()
class CreateOrderDTO {
  final List<CreateOrderItem> products;

  final int userId;

  final int addressId;

  final String? note;

  CreateOrderDTO({
    required this.products,
    required this.userId,
    required this.addressId,
    this.note,
  });

  factory CreateOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderDTOToJson(this);
}
