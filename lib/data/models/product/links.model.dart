import 'package:json_annotation/json_annotation.dart';
part 'links.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Links {
  final String? first;
  final String? last;
  final int? prev;
  final int? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

   factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

}
