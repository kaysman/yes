import 'package:json_annotation/json_annotation.dart';
import 'package:yes/data/models/category/category.model.dart';
part 'budget.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Budget {
  final int id;
  final String? title_tm;
  final String? title_ru;
  final String? subtitle_tm;
  final String? subtitle_ru;
  final String? image;
  final String? background;
  final int? price;
  final Category category;
  final int category_id;
  final int? products_count;

  Budget({
    required this.id,
    this.title_ru,
    this.image,
    this.title_tm,
    this.background,
    this.subtitle_ru,
    this.subtitle_tm,
    required this.category,
    required this.category_id,
    this.price,
    this.products_count,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  @override
  String toString() => "$id $title_tm";
}
