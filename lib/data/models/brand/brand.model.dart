import 'package:json_annotation/json_annotation.dart';
part 'brand.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Brand {
  final int id;
  final String? name;
  final String? logo;
  final String? image;
  final String? background;
  final int? products_count;

  Brand({
    required this.id,
    this.name,
    this.logo,
    this.image,
    this.background,
    this.products_count,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  @override
  String toString() => "$id $name";
}
