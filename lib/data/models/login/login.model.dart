import 'package:json_annotation/json_annotation.dart';
part 'login.model.g.dart';

@JsonSerializable()
class Login {
  final String phone;
  final String password;

  Login({
    required this.phone,
    required this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
  // flutter pub run build_runner build --delete-conflicting-outputs

}
