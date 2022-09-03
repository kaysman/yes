// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserDTO _$CreateUserDTOFromJson(Map<String, dynamic> json) =>
    CreateUserDTO(
      password: json['password'] as String?,
      name: json['name'] as String?,
      gender: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
      role: $enumDecodeNullable(_$RoleTypeEnumMap, json['role']),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$CreateUserDTOToJson(CreateUserDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'gender': _$GenderTypeEnumMap[instance.gender],
      'phoneNumber': instance.phoneNumber,
      'role': _$RoleTypeEnumMap[instance.role],
    };

const _$GenderTypeEnumMap = {
  GenderType.MALE: 'MALE',
  GenderType.FEMALE: 'FEMALE',
  GenderType.OTHER: 'OTHER',
};

const _$RoleTypeEnumMap = {
  RoleType.ADMIN: 'ADMIN',
  RoleType.BUSINESS_USER: 'BUSINESS_USER',
  RoleType.END_USER: 'END_USER',
};
