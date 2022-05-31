import 'package:json_annotation/json_annotation.dart';
import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/models/market/market.model.dart';
part 'promotion.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Promotion {
  final int id;
  final String? title_tm;
  final String? title_ru;
  final String? background_image;
  final String? image;
  final int? percent;
  final Market? market;
  final Brand? brand;
  final Category? category;

  Promotion({
    required this.id,
    this.title_tm,
    this.title_ru,
    this.background_image,
    this.image,
    this.percent,
    this.market,
    this.brand,
    this.category,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  @override
  String toString() => "$id $title_tm";
}
