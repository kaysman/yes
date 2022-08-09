import 'package:yes/data/models/adress/create-adress.model.dart';
import 'package:yes/data/models/user/user.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'adress.model.g.dart';

@JsonSerializable()
class AdressEntity {
  final int addressId;
  final int userId;
  final String? title;
  final bool isdefault;
  final UserEntity? user;
  final CreateAddressDTO address;

  AdressEntity({
    required this.addressId,
    required this.userId,
    this.title,
    required this.isdefault,
    this.user,
    required this.address,
  });

  factory AdressEntity.fromJson(Map<String, dynamic> json) => AdressEntity(
        addressId: json['addressId'] as int,
        userId: json['userId'] as int,
        title: json['title'] as String?,
        isdefault: json['default'] as bool,
        user: json['user'] == null
            ? null
            : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
        address:
            CreateAddressDTO.fromJson(json['address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => _$AdressEntityToJson(this);

  @override
  String toString() => '$addressId user: $userId title:$title';
}
