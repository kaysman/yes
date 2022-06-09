// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      isSelected: json['isSelected'] as bool? ?? false,
      id: json['id'] as int,
      name_tm: json['name_tm'] as String?,
      name_ru: json['name_ru'] as String?,
      image: json['image'] as String?,
      // images: (json['images'] as List<dynamic>?)
      //     ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      price: json['price'] as int?,
      // color: json['color'] == null
      //     ? null
      //     : Color.fromJson(json['color'] as Map<String, dynamic>),
      // gender: json['gender'] == null
      //     ? null
      //     : Gender.fromJson(json['gender'] as Map<String, dynamic>),
      // code: json['code'] as String?,
      // quantity: json['quantity'] as int?,
      // brand: json['brand'] == null
      //     ? null
      //     : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      // market: json['market'] == null
      //     ? null
      //     : Market.fromJson(json['market'] as Map<String, dynamic>),
      // category: json['category'] == null
      //     ? null
      //     : Category.fromJson(json['category'] as Map<String, dynamic>),
      created_at: json['created_at'] as String?,
      description_tm: json['description_tm'] as String?,
      description_ru: json['description_ru'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name_tm': instance.name_tm,
      'name_ru': instance.name_ru,
      'image': instance.image,
      'images': instance.images,
      'price': instance.price,
      'color': instance.color,
      'gender': instance.gender,
      'code': instance.code,
      'quantity': instance.quantity,
      'brand': instance.brand,
      'market': instance.market,
      'isSelected': instance.isSelected,
      'category': instance.category,
      'created_at': instance.created_at,
      'description_tm': instance.description_tm,
      'description_ru': instance.description_ru,
    };
