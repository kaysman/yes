// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      id: json['id'] as int,
      name_tm: json['name_tm'] as String?,
      name_ru: json['name_ru'] as String?,
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'id': instance.id,
      'name_tm': instance.name_tm,
      'name_ru': instance.name_ru,
    };
