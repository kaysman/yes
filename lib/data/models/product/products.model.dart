import 'filters.model.dart';
import 'links.model.dart';
import 'meta.model.dart';
import 'product.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products.model.g.dart';


@JsonSerializable(explicitToJson: false)
class Products {
  final Filters? filters;
  final List<Product>? products;
  final Links? links;
  final Meta? meta;
  final String? path;
  final int? per_page;
  final int? to;
  final int? total;

  Products({
    this.filters,
    this.products,
    this.links,
    this.meta,
    this.path,
    this.per_page,
    this.to,
    this.total,
  });

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);



}
