import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/app_bar_icon_btn.dart';

class ProductDetailIcons extends StatelessWidget {
  const ProductDetailIcons({
    Key? key,
    required this.onShareTap,
    required this.onFavoriteTap,
    required this.onBagTap,
  }) : super(key: key);

  final VoidCallback onShareTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onBagTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        children: [
          AppBarIconBtn(icon: Icons.share, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(icon: Icons.favorite_outline, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(icon: Icons.shopping_bag_outlined, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}