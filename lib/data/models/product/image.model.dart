import 'package:json_annotation/json_annotation.dart';
part 'image.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Image {
  final int id;
  final String? image;

  Image({
    required this.id,
    this.image,
  });

   factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

}
