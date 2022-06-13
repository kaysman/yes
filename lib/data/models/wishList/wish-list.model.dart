import 'package:equatable/equatable.dart';
import 'package:yes/data/models/category/category.model.dart';

class WishListItem with EquatableMixin {
  int id;
  String? name_tm;
  String? name_ru;
  String? image;
  int? price;
  String? code;
  int? quantity;
  int? totalPrice;
  Category? category;
  String? description_tm;
  String? description_ru;
  bool isSelected;
  int? defQuantity;

  WishListItem({
    required this.id,
    this.category,
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
    this.price,
  });

  @override
  String toString() => this.name_tm ?? '';

  @override
  List<Object?> get props => [id, name_tm];
}
