import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
part 'market.model.g.dart';

@JsonSerializable()
class MarketEntity with EquatableMixin {
  final int? id;
  final String? title;
  final String? address;
  final String? description;
  final String? phoneNumber;
  final String? ownerName;
  final List<ProductEntity>? products;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  MarketEntity(
      {required this.id,
      required this.title,
      this.address,
      this.description,
      required this.phoneNumber,
      this.ownerName,
      this.createdAt,
      this.updatedAt,
      this.products});

  factory MarketEntity.fromJson(Map<String, dynamic> json) =>
      _$MarketEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MarketEntityToJson(this);

  @override
  List<Object?> get props => [id];
}
