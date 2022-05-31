// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      id: json['id'] as int,
      title: json['title'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      market_owner: json['market_owner'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'logo': instance.logo,
      'address': instance.address,
      'description': instance.description,
      'phone': instance.phone,
      'market_owner': instance.market_owner,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
