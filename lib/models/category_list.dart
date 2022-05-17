import 'category_list_sub_item.dart';

class CategoryListModel {
  final String title;
  final String subtitle;
  final List<CategoryListSubItemModel>? subCategoris;
  final String imgPath;
  final String bgImgPAth;

  CategoryListModel({
    required this.title,
    required this.subtitle,
    required this.imgPath,
    required this.bgImgPAth,
    this.subCategoris,
  });
}




