import 'package:dio/dio.dart';

import 'models/categories_model.dart';
import 'models/product_model.dart';


final BaseOptions kBaseOptions =
    BaseOptions(baseUrl: 'http://yes.com.tm/api/front');



List<CategoryModel> categories = [
  CategoryModel(
      background_image: 'assets/ct_bg.jpg',
      image: 'assets/child.png',
      isExpanded: false,
      subtitle_tm: 'New Fashion',
      title_tm: 'Kids Clothing',
      sub:sub),
  CategoryModel(
    background_image: 'assets/ct_bg.jpg',
    image: 'assets/child.png',
    isExpanded: false,
    subtitle_tm: 'New Fashion',
    title_tm: 'Kids Clothing',
    sub: sub
  ),
  CategoryModel(
    background_image: 'assets/ct_bg.jpg',
    image: 'assets/child.png',
    isExpanded: false,
    subtitle_tm: 'New Fashion',
    title_tm: 'Kids Clothing',
    sub: sub
  ),
];

List<CategoryModel> sub = [
  CategoryModel(
      background_image: 'assets/ct_bg.jpg',
      image: 'assets/child.png',
      isExpanded: false,
      subtitle_tm: 'New Fashion',
      title_tm: 'Kids Clothing',
      sub: []),
  CategoryModel(
    background_image: 'assets/ct_bg.jpg',
    image: 'assets/child.png',
    isExpanded: false,
    subtitle_tm: 'New Fashion',
    title_tm: 'Kids Clothing',
    // sub: categories
  ),
  CategoryModel(
    background_image: 'assets/ct_bg.jpg',
    image: 'assets/child.png',
    isExpanded: false,
    subtitle_tm: 'New Fashion',
    title_tm: 'Kids Clothing',
    // sub: categories
  ),
];

List<ProductsModel> products = [
  ProductsModel(
    isNew: false,
    commentCount: 2,
    rating: 2.3,
    productName: 'Peter England Casuals',
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 1.099,
    imagePath: 'trenM.jpg',
    oldPrice: 380,
    discount: 20,
    detailImages: ['assets/trenM.jpg', 'assets/banner.jpg']
  ),
  ProductsModel(
    isNew: true,
    productName: 'Peter England Casuals',
    rating: 3.7,
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 2.299,
    imagePath: 'my.jpg',
    oldPrice: 250,
    discount: 18,
  ),
  ProductsModel(
    isNew: true,
    productName: 'Peter England Casuals',
    rating: 3.7,
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 2.299,
    imagePath: 'my.jpg',
    oldPrice: 250,
    discount: 18,
  ),
  ProductsModel(
    isNew: true,
    productName: 'Peter England Casuals',
    rating: 3.7,
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 2.299,
    imagePath: 'my.jpg',
    oldPrice: 250,
    discount: 18,
  ),
  ProductsModel(
    isNew: true,
    productName: 'Peter England Casuals',
    rating: 3.7,
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 2.299,
    imagePath: 'my.jpg',
    oldPrice: 250,
    discount: 18,
  ),
  ProductsModel(
    isNew: true,
    productName: 'Peter England Casuals',
    rating: 3.7,
    productCode: 'Men Slim Fit Jogger Jeans',
    productPrice: 2.299,
    imagePath: 'my.jpg',
    oldPrice: 250,
    discount: 18,
  ),
];
