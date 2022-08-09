import 'package:json_annotation/json_annotation.dart';
part 'create-order-item.model.g.dart';

@JsonSerializable()
class CreateOrderItem {
  final int productId;

  final int quantity;

  final int size_id;

  CreateOrderItem({
    required this.productId,
    required this.quantity,
    required this.size_id,
  });

  factory CreateOrderItem.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderItemToJson(this);

  @override
  String toString() => '$productId sany: $quantity size:$size_id';
}
