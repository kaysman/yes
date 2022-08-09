import 'package:json_annotation/json_annotation.dart';
part 'user.model.g.dart';

@JsonSerializable()
class UserEntity {
  final int id;
  final String? phoneNumber;
  final String? password;
  final String? name;
  final String? gender;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? image;

  UserEntity({
    required this.id,
    this.phoneNumber,
    this.password,
    this.name,
    this.gender,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() => 'name:$name id:$id  phone:$phoneNumber';
}
