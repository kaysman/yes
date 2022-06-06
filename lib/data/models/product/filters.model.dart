import 'package:json_annotation/json_annotation.dart';

import 'color.model.dart';
import 'gender.model.dart';
import 'size.model.dart';
part 'filters.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Filters {
  final List<Size>? sizes;
  final List<Color>? colors;
  final List<Gender>? genders;

  Filters({
    this.sizes,
    this.colors,
    this.genders,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
}
