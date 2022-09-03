import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'package:yes/presentation/shared/storage.dart';

Map<String, String> header() {
  return {
    "Content-Type": "application/json",
    "Accept": "*/*",
  };
}

Future<Map<String, String>> get headers async => {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": 'Bearer ${await getToken()}',
    };

Future<String?> getToken() async {
  var disk = (await LocalStorage.instance);
  return disk.getToken;
}

class Apis {
  static const kBaseUrl = 'http://192.168.1.8:3333';
  // http://yes.com.tm/api/front

  // auth
  static const kLogin = '/api/front/login';
  static const kRegister = '/register';

  // categories
  static const kHomeCategories = '/api/front/home_categories';
  static const kTabCategories = '/api/front/tab_categories';
  static kCategoryById(int subId) => "/api/front/category/:$subId";
  static kCategoryProducts(int subId) => "/api/front/category/:$subId/products";

  // promotions
  static const kAllPromotions = '/api/front/promotions';
  static kPromotionProducts(int? id) => "/api/front/promotion/$id/products";

  // brands
  static const kAllBrands = '/api/front/brands';
  static const kVIPBrands = '/api/front/vip/brands';
  static kBrandById(int id) => "/api/front/brand/$id";
  static kBrandProducts(int id) => "/api/front/brand/$id/products";

  // budgets
  static const kAllBudgets = '/api/front/budgets';
  static kBudgetById(int id) => '/api/front/budget/$id';
  static kBudgetProducts(int id) => '/api/front/budget/$id/products';

  // products
  static kProductById(int id) => '/api/front/product/$id';
}

final OutlineInputBorder kErrorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red),
  borderRadius: BorderRadius.circular(8),
);
final OutlineInputBorder kFocusedInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: kGrey1Color,
  ),
  borderRadius: BorderRadius.circular(8),
);
final OutlineInputBorder kEnabledInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kGrey3Color),
  borderRadius: BorderRadius.circular(8),
);
final OutlineInputBorder kDisabledInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kGrey4Color),
  borderRadius: BorderRadius.circular(8),
);

List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: Offset(0, 4),
    blurRadius: 30,
  ),
];

enum SnackbarType { success, error }

void showSnackBar(
  BuildContext context,
  Widget child, {
  SnackbarType type = SnackbarType.error,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor != null
          ? backgroundColor
          : type == SnackbarType.error
              ? Color(0xffdf4759)
              : Color(0xFF15AA40),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: child,
      width: 200,
    ),
  );
}

Future<void> showAppBottomSheet(
  BuildContext context,
  Widget body,
) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: body,
      );
    },
  );
}

Future<void> alreadyOrderedSheet(BuildContext context) async {
  await showAppBottomSheet(
    context,
    Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Siz sargyt etdiniz, sargydynyz gowsurulandan sonra, sargyt edip bilersiniz!',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 14,
          ),
          Button(
            text: 'OK',
            primary: kPrimaryColor,
            textColor: kWhite,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ),
  );
}

List<Map<String, dynamic>> menuItems = [
  {
    "activeIcon": Icon(
      Icons.home,
      color: kPrimaryColor,
    ),
    "icon": Icon(
      Icons.home_outlined,
    ),
    "label": 'Bas sahypa'
  },
  {
    "activeIcon": Icon(
      CupertinoIcons.rectangle_grid_2x2_fill,
      color: kPrimaryColor,
    ),
    "icon": Icon(
      CupertinoIcons.rectangle_grid_2x2,
    ),
    "label": 'Bolumler'
  },
  {
    "activeIcon": Icon(
      CupertinoIcons.bag_fill,
      color: kPrimaryColor,
    ),
    "icon": Icon(
      CupertinoIcons.bag,
    ),
    "label": 'Sebet'
  },
  {
    "activeIcon": Icon(
      CupertinoIcons.person_fill,
      color: kPrimaryColor,
    ),
    "icon": Icon(
      CupertinoIcons.person,
    ),
    "label": 'Profil'
  },
];
