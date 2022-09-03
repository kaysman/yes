import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/app_bar_icon_btn.dart';
import 'package:yes/presentation/shared/components/buttons.dart';

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
          AppBarIconBtn(
            iconButton: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(
            iconButton: FavoriteButton(),
          ),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(
            iconButton: CartButton(),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
