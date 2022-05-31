// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      id: json['id'] as int,
      title_ru: json['title_ru'] as String?,
      image: json['image'] as String?,
      title_tm: json['title_tm'] as String?,
      background: json['background'] as String?,
      subtitle_ru: json['subtitle_ru'] as String?,
      subtitle_tm: json['subtitle_tm'] as String?,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      category_id: json['category_id'] as int,
      price: json['price'] as int?,
      products_count: json['products_count'] as int?,
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'id': instance.id,
      'title_tm': instance.title_tm,
      'title_ru': instance.title_ru,
      'subtitle_tm': instance.subtitle_tm,
      'subtitle_ru': instance.subtitle_ru,
      'image': instance.image,
      'background': instance.background,
      'price': instance.price,
      'category': instance.category,
      'category_id': instance.category_id,
      'products_count': instance.products_count,
    };
