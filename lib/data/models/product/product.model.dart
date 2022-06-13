import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../brand/brand.model.dart';
import '../category/category.model.dart';
import '../market/market.model.dart';
import 'color.model.dart';
import 'gender.model.dart';
import 'image.model.dart';
part 'product.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Product with EquatableMixin {
  final int id;
  final String? name_tm;
  final String? name_ru;
  final String? image;
  final List<Image>? images;
  int? price;
  final Color? color;
  final Gender? gender;
  final String? code;
  final int? quantity;
  final Brand? brand;
  final Market? market;
  final Category? category;
  final String? created_at;
  final String? description_tm;
  final String? description_ru;
  bool isSelected;

  Product({
    this.isSelected = true,
    required this.id,
    this.name_tm,
    this.name_ru,
    this.image,
    this.images,
    this.price,
    this.color,
    this.gender,
    this.code,
    this.quantity,
    this.brand,
    this.market,
    this.category,
    this.created_at,
    this.description_tm,
    this.description_ru,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() => this.name_tm ?? '';

  @override
  List<Object?> get props => [id];
}