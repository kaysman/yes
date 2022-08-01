import 'package:equatable/equatable.dart';
import 'package:yes/data/models/product%20-new/image.model.dart';

import '../product -new/size.model.dart';

class CartItem with EquatableMixin {
  int? id;
  String? name_tm;
  String? name_ru;
  int? ourPrice;
  int? marketPrice;
  int? quantity;
  String? code;
  String? description_tm;
  String? description_ru;
  List<ImageEntity>? images;
  List<SizeEntity>? sizes;
  String? image;
  int price;
  int? totalPrice;
  bool isSelected;
  int defQuantity;

  CartItem({
    required this.id,
    this.ourPrice,
    this.marketPrice,
    this.images,
    this.sizes,
    this.name_tm,
    this.name_ru,
    this.image,
    this.code,
    this.quantity,
    this.description_tm,
    this.totalPrice,
    this.description_ru,
    this.isSelected = true,
    this.defQuantity = 1,
    required this.price,
  });

  @override
  String toString() => this.name_tm ?? '';

  @override
  List<Object?> get props => [id];
}
