import 'package:flutter/material.dart';
import 'package:yes_demo/models/category_list.dart';
import 'package:yes_demo/models/product_model.dart';
import '../models/category_list_sub_item.dart';

class DataBase {

  static List<Color> bgColors = [
    Colors.pinkAccent.withOpacity(.1),
    Colors.amber.withOpacity(.1),
    Colors.lightGreen.withOpacity(.1).withOpacity(.1),
    Colors.amber.withOpacity(.1),
    Colors.lightGreen.withOpacity(.1),
    Colors.pinkAccent.withOpacity(.1),
    Colors.blueAccent.withOpacity(.1),
    Colors.lightGreen.withOpacity(.1),
    Colors.blueAccent.withOpacity(.1),
    Colors.lightGreen.withOpacity(.1),
    Colors.pinkAccent.withOpacity(.1),
    Colors.blueAccent.withOpacity(.1),
    Colors.lightGreen.withOpacity(.1)
  ];


  static List<CategoryListModel> categories = [
    CategoryListModel(
      title: 'SPRING\nSUMMER 2022',
      bgImgPAth: 'assets/ct_bg.jpg',
      imgPath: 'assets/trend.png',
      subtitle: 'New Styles Getting Added Daily',
      subCategoris: summerSubCategories,
    ),
    CategoryListModel(
      title: 'KIDS',
      bgImgPAth: 'assets/pink.jpg',
      imgPath: 'assets/child.png',
      subtitle: 'Brands, Clothing, Footwear , Accesosrs',
      subCategoris: kidsSubCategories,
    ),
    CategoryListModel(
      title: 'Women',
      bgImgPAth: 'assets/pink.jpg',
      imgPath: 'assets/login.png',
      subtitle: 'T-shirt, Caps, ForMen',
      // subCategoris: kidsSubCategories,
    ),
  ];

  static List<CategoryListSubItemModel> summerSubCategories = [
    CategoryListSubItemModel(
      title: 'Top Brands for Summer',
      subChildCategories: ['H&M', "RoadSter", 'Max for summer', 'Puma'],
      
    ),
    CategoryListSubItemModel(
      title: 'Summer Brands',
      subChildCategories: [
        'Explore Kids Store in summer',
        'Dresses for summer',
        "Night suits",
        'Track Pants'
      ],
    ),
  ];

  static List<CategoryListSubItemModel> kidsSubCategories = [
    CategoryListSubItemModel(
      title: 'Top Brands for Kids',
      subChildCategories: ['H&M', "RoadSter for Kids", 'Max', 'Puma'],
    ),
    CategoryListSubItemModel(
      title: 'Kids',
      subChildCategories: [
        'Explore Kids Store',
        'Dresses for kids',
        "Night suits",
        'Track Pants'
      ],
    ),
  ];

  static List<ProductsModel> products = [
    ProductsModel(
      isNew: false,
      commentCount: 2,
      rating: 2.3,
      productName: 'Peter England Casuals',
      productCode: 'Men Slim Fit Jogger Jeans',
      productPrice: 2.299,
      imagePath: 'assets/trenM.jpg',
      oldPrice: 380,
      discount: 20,
      detailImages: ['assets/trenM.jpg', 'assets/my.jpg'],
    ),
    ProductsModel(
        detailImages: ['assets/trenM.jpg', 'assets/my.jpg'],
        isNew: true,
        productName: 'Peter England Casuals',
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/my.jpg',
        oldPrice: 250),
    ProductsModel(
        isNew: false,
        commentCount: 2,
        rating: 2.3,
        detailImages: ['assets/trenM.jpg', 'assets/my.jpg'],
        productName: 'Peter England Casuals',
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/trenM.jpg',
        oldPrice: 380,
        discount: 20),
    ProductsModel(
        isNew: false,
        detailImages: ['assets/trenM.jpg', 'assets/my.jpg'],
        commentCount: 2,
        rating: 2.3,
        productName: 'Peter England Casuals',
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/trenM.jpg',
        oldPrice: 380,
        discount: 20),
    ProductsModel(
        isNew: false,
        commentCount: 2,
        rating: 2.3,
        productName: 'Peter England Casuals',
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/trenM.jpg',
        oldPrice: 380,
        discount: 20),
    ProductsModel(
        isNew: false,
        commentCount: 2,
        rating: 2.3,
        productName: 'Peter England Casuals',
        productCode: 'Men Slim Fit Jogger Jeans',
        productPrice: 2.299,
        imagePath: 'assets/trenM.jpg',
        oldPrice: 380,
        discount: 20),
  ];
}
