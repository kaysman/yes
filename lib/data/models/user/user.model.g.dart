// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'name': instance.name,
      'gender': instance.gender,
      'role': instance.role,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
    };
