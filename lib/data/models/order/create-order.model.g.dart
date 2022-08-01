// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderDTO _$CreateOrderDTOFromJson(Map<String, dynamic> json) =>
    CreateOrderDTO(
      products: (json['products'] as List<dynamic>)
          .map((e) => CreateOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['userId'] as int,
      addressId: json['addressId'] as int,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CreateOrderDTOToJson(CreateOrderDTO instance) =>
    <String, dynamic>{
      'products': instance.products,
      'userId': instance.userId,
      'addressId': instance.addressId,
      'note': instance.note,
    };
