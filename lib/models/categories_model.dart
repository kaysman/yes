class CategoriesModel {
  List<CategoryModel>? data;

  CategoriesModel({this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        data: (json['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList());
  }
}

class CategoryModel {
  int? id;
  String? title_tm;
  String? title_ru;
  String? subtitle_tm;
  String? subtitle_ru;
  String? image;
  String? background_image;
  List<CategoryModel>? sub;
  bool? isExpanded;

  CategoryModel({
    this.id,
    this.title_tm,
    this.title_ru,
    this.subtitle_tm,
    this.subtitle_ru,
    this.image,
    this.background_image,
    this.sub,
    this.isExpanded = false
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        title_tm: json['title_tm'],
        title_ru: json['title_ru'],
        subtitle_tm: json['subtitle_tm'],
        subtitle_ru: json['subtitle_ru'],
        image: json['image'],
        background_image: json['background_image'],
        sub: (json['sub'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList());
  }
}
