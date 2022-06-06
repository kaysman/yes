// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as int,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      image: json['image'] as String?,
      background: json['background'] as String?,
      background_image: json['background_image'] as String?,
      products_count: json['products_count'] as int?,
      vip: json['vip'] as int?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'image': instance.image,
      'background': instance.background,
      'background_image': instance.background_image,
      'products_count': instance.products_count,
      'vip': instance.vip,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
