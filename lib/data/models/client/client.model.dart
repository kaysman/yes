import 'package:json_annotation/json_annotation.dart';
part 'client.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Client {
  final int id;
  final String phone;
  final String address;
  final String? name;
  final dynamic gender;
  final DateTime? created_at;
  final DateTime? updated_at;

  Client({
   required this.id,
    required this.phone,
    required this.address,
    this.name,
    this.gender,
    this.created_at,
    this.updated_at,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  
}
