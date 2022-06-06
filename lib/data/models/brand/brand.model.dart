import 'package:json_annotation/json_annotation.dart';
part 'brand.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Brand {
  final int id;
  final String? name;
  final String? logo;
  final String? image;
  final String? background;
  final String? background_image;
  final int? products_count;
  final int? vip;
  final DateTime? created_at;
  final DateTime? updated_at;

  Brand({
    required this.id,
    this.name,
    this.logo,
    this.image,
    this.background,
    this.background_image,
    this.products_count,
    this.vip,
    this.created_at,
    this.updated_at
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  String get logoWithPrefix => "http://yes.com.tm$logo";
  String get imageWithPrefix => "http://yes.com.tm$image";
  String get bgImageWithPrefix => "http://yes.com.tm$background_image";

  @override
  String toString() => "$id $name";
}
