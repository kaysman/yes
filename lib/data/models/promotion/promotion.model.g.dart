// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
      id: json['id'] as int,
      title_tm: json['title_tm'] as String?,
      title_ru: json['title_ru'] as String?,
      background_image: json['background_image'] as String?,
      image: json['image'] as String?,
      percent: json['percent'] as int?,
      market: json['market'] == null
          ? null
          : Market.fromJson(json['market'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'id': instance.id,
      'title_tm': instance.title_tm,
      'title_ru': instance.title_ru,
      'background_image': instance.background_image,
      'image': instance.image,
      'percent': instance.percent,
      'market': instance.market,
      'brand': instance.brand,
      'category': instance.category,
    };
