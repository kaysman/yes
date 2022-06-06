import 'package:json_annotation/json_annotation.dart';

import 'link.model.dart';
part 'meta.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Meta {
  final int? current_page;
  final int? from;
  final List<Link>? links;

  Meta({
    this.current_page,
    this.from,
    this.links,
  });

   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

}
