import 'package:json_annotation/json_annotation.dart';
part 'color.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Color {
  final int id;
  final String? name_tm;
  final String? name_ru;

  Color({
    required this.id,
    this.name_tm,
    this.name_ru,
  });

  factory Color.fromJson(Map<String, dynamic> json) =>
      _$ColorFromJson(json);


}
