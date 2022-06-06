// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      current_page: json['current_page'] as int?,
      from: json['from'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'links': instance.links,
    };
