// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) => LoginDTO(
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$LoginDTOToJson(LoginDTO instance) => <String, dynamic>{
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
    };
