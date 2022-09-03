import 'package:json_annotation/json_annotation.dart';
import 'package:yes/data/enums/user-type.dart';
part 'register_request.model.g.dart';

@JsonSerializable()
class CreateUserDTO {
  final String? name;
  final String? password;
  final GenderType? gender;
  final String? phoneNumber;
  final RoleType? role;

  CreateUserDTO({
    this.password,
    this.name,
    this.gender,
    this.role,
    this.phoneNumber,
  });

  factory CreateUserDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserDTOToJson(this);

  @override
  String toString() => "${this.phoneNumber} ${this.password} ";
}
