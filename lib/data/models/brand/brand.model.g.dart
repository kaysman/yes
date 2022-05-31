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
      products_count: json['products_count'] as int?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'image': instance.image,
      'background': instance.background,
      'products_count': instance.products_count,
    };
