class ProductsModel {
  final bool? isNewSeason;
  final bool? isNew;
  final double? rating;
  final int? commentCount;
  final String productName;
  final String productCode;
  final double productPrice;
  final String? imagePath;
  final double oldPrice;
  final int? discount;
  final List<String>? detailImages;
  final String? brand;

  ProductsModel(
      {this.brand,
      this.detailImages,
      required this.imagePath,
      this.isNewSeason = false,
      required this.isNew,
      this.rating,
      this.commentCount,
      required this.productName,
      required this.productCode,
      required this.productPrice,
      required this.oldPrice,
      this.discount});

  String get newPrice {
    var newprice;
    if (discount != null && oldPrice != null) {
      newprice = ((oldPrice * discount!) / 100);
    }
    return '$newprice';
  }
}
