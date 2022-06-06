import 'package:json_annotation/json_annotation.dart';
part 'gender.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Gender {
  final int id;
  final String? name_tm;
  final String? name_ru;

  Gender({
    required this.id,
    this.name_tm,
    this.name_ru,
  });

   factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
}
