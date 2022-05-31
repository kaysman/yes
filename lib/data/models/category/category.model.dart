import 'package:json_annotation/json_annotation.dart';
part 'category.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Category {
  final int id;
  final String? title_tm;
  final String? title_ru;
  final String? subtitle_tm;
  final String? subtitle_ru;
  final String? image;
  final String? background_image;
  final List<Category>? sub;

  Category({
    required this.id,
    this.title_ru,
    this.image,
    this.title_tm,
    this.background_image,
    this.sub,
    this.subtitle_ru,
    this.subtitle_tm,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  String toString() => "$id $title_tm";
}
