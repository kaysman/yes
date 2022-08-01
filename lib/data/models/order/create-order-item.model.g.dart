// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-order-item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderItem _$CreateOrderItemFromJson(Map<String, dynamic> json) =>
    CreateOrderItem(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      size_id: json['size_id'] as int,
    );

Map<String, dynamic> _$CreateOrderItemToJson(CreateOrderItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'size_id': instance.size_id,
    };
