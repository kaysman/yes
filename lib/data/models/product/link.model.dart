import 'package:json_annotation/json_annotation.dart';
part 'link.model.g.dart';



@JsonSerializable(explicitToJson: false)
class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

   factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

}
