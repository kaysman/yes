// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      title_ru: json['title_ru'] as String?,
      image: json['image'] as String?,
      title_tm: json['title_tm'] as String?,
      background_image: json['background_image'] as String?,
      sub: (json['sub'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtitle_ru: json['subtitle_ru'] as String?,
      subtitle_tm: json['subtitle_tm'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title_tm': instance.title_tm,
      'title_ru': instance.title_ru,
      'subtitle_tm': instance.subtitle_tm,
      'subtitle_ru': instance.subtitle_ru,
      'image': instance.image,
      'background_image': instance.background_image,
      'sub': instance.sub,
    };
