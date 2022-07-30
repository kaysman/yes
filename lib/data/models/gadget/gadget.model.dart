import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/gadget/image.model.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
part 'gadget.model.g.dart';

@JsonSerializable()
class GadgetEntity with EquatableMixin {
  final int? id;
  final GadgetType type;
  final List<GadgetImage>? items;
  final List<ProductEntity>? products;
  final int? queue;
  final String? title;
  final String? status;
  final String? location;

  GadgetEntity({
    this.items,
    this.status,
    this.location,
    required this.type,
    this.products,
    this.queue,
    this.title,
    this.id,
  });

  factory GadgetEntity.fromJson(Map<String, dynamic> json) =>
      _$GadgetEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GadgetEntityToJson(this);

  @override
  List<Object?> get props => [this.id];

  @override
  String toString() => 'Gadget $id $type';
}
