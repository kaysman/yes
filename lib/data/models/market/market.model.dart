import 'package:json_annotation/json_annotation.dart';
part 'market.model.g.dart';

@JsonSerializable(explicitToJson: false)
class Market {
  final int id;
  final String? title;
  final String? logo;
  final String? address;
  final String? description;
  final String? phone;
  final String? market_owner;
  final DateTime? created_at;
  final DateTime? updated_at;

  Market({
    required this.id,
    this.title,
    this.logo,
    this.address,
    this.description,
    this.phone,
    this.market_owner,
    this.created_at,
    this.updated_at,
  });

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  @override
  String toString() => "$id";
}
