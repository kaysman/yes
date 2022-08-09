import 'package:json_annotation/json_annotation.dart';
part 'create-adress.model.g.dart';

@JsonSerializable()
class CreateAddressDTO {
  final int? id;
  final String addressLine1;
  final String? addressLine2;
  final String? title;
  final int? userId;
  final bool? isdefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CreateAddressDTO({
    this.updatedAt,
    this.id,
    this.createdAt,
    required this.addressLine1,
    this.addressLine2,
    this.title,
    required this.userId,
    this.isdefault,
  });
  factory CreateAddressDTO.fromJson(Map<String, dynamic> json) =>
      CreateAddressDTO(
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        addressLine1: json['addressLine1'] as String,
        addressLine2: json['addressLine2'] as String?,
        title: json['title'] as String?,
        userId: json['userId'] as int?,
        isdefault: json['default'] as bool?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'addressLine1': this.addressLine1,
        'addressLine2': this.addressLine2,
        'title': this.title,
        'userId': this.userId,
        'isdefault': this.isdefault,
        'createdAt': this.createdAt?.toIso8601String(),
        'updatedAt': this.updatedAt?.toIso8601String(),
      };

  @override
  String toString() => '$addressLine1 user: $userId title:$title';
}
