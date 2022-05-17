class BrandsModel {
  final List<BrandModel>? data;

  BrandsModel({this.data});

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      data: (json['data'] as List).map((e) => BrandModel.fromJson(e)).toList(),
    );
  }
}

class BrandModel {
  final int? id;
  final String? name;
  final String? logo;
  final String? image;
  final String? background;
  final int? products_count;

  BrandModel({this.id, this.name, this.logo, this.image, this.background,
      this.products_count});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id : json['id'],
      name : json['name'],
      logo : json['logo'],
      image : json['image'],
      background : json['background'],
      products_count : json['products_count'],
    );
  }
}
