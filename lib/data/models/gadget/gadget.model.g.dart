// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gadget.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GadgetEntity _$GadgetEntityFromJson(Map<String, dynamic> json) => GadgetEntity(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GadgetImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      location: json['location'] as String?,
      type: $enumDecode(_$GadgetTypeEnumMap, json['type']),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      queue: json['queue'] as int?,
      title: json['title'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$GadgetEntityToJson(GadgetEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$GadgetTypeEnumMap[instance.type],
      'items': instance.items,
      'products': instance.products,
      'queue': instance.queue,
      'title': instance.title,
      'status': instance.status,
      'location': instance.location,
    };

const _$GadgetTypeEnumMap = {
  GadgetType.TWO_SMALL_CARDS_HORIZONTAL: 'TWO_SMALL_CARDS_HORIZONTAL',
  GadgetType.BANNER_SWIPE_WITH_DOTS: 'BANNER_SWIPE_WITH_DOTS',
  GadgetType.TWO_TO_TWO_WITH_TITLE_AS_IMAGE: 'TWO_TO_TWO_WITH_TITLE_AS_IMAGE',
  GadgetType.BANNER_FOR_MEN_AND_WOMEN: 'BANNER_FOR_MEN_AND_WOMEN',
  GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT:
      'TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT',
  GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      'CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT',
  GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      'CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE',
  GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      'CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE',
  GadgetType.THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT:
      'THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT',
  GadgetType.ONE_IMAGE_WITH_FULL_WIDTH: 'ONE_IMAGE_WITH_FULL_WIDTH',
  GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      'CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT',
  GadgetType.POPULAR: 'POPULAR',
  GadgetType.TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      'TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT',
  GadgetType.CIRCLE_ITEMS: 'CIRCLE_ITEMS',
  GadgetType.CATEGORY_BANNER: 'CATEGORY_BANNER',
};
