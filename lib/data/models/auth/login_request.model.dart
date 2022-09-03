import 'package:json_annotation/json_annotation.dart';
part 'login_request.model.g.dart';

@JsonSerializable()
class LoginDTO {
  final String? password;
  final String? phoneNumber;

  LoginDTO({
    this.password,
    this.phoneNumber,
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);

  @override
  String toString() => "${this.phoneNumber} ${this.password} ";
}
