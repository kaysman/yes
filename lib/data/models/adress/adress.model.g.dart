// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adress.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdressEntity _$AdressEntityFromJson(Map<String, dynamic> json) => AdressEntity(
      addressId: json['addressId'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String?,
      isdefault: json['isdefault'] as bool,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      address:
          CreateAddressDTO.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdressEntityToJson(AdressEntity instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'userId': instance.userId,
      'title': instance.title,
      'isdefault': instance.isdefault,
      'user': instance.user,
      'address': instance.address,
    };
