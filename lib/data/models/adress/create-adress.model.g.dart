// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-adress.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressDTO _$CreateAddressDTOFromJson(Map<String, dynamic> json) =>
    CreateAddressDTO(
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String?,
      title: json['title'] as String?,
      userId: json['userId'] as int,
      isdefault: json['isdefault'] as bool?,
    );

Map<String, dynamic> _$CreateAddressDTOToJson(CreateAddressDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'title': instance.title,
      'userId': instance.userId,
      'isdefault': instance.isdefault,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
