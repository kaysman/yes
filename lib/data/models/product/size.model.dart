import 'package:json_annotation/json_annotation.dart';
part 'size.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Size {
  final int id;
  final String? name_tm;
  final String? name_ru;
  Size({
    required this.id,
    this.name_tm,
    this.name_ru,
  });

   factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

}
