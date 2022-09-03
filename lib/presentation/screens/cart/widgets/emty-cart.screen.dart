import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/category/category_screen.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';

class EmtyCartScreen extends StatelessWidget {
  const EmtyCartScreen({Key? key, required this.onStartShop}) : super(key: key);
  final VoidCallback onStartShop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        actions: [
          FavoriteButton(),
        ],
        elevation: 0.6,
        title: AppBarTitle(title: 'Sebet'),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/emtyCart.jpg',
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Button(
              padding: const EdgeInsets.all(14),
              primary: kPrimaryColor,
              textColor: kWhite,
              textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 18,
                    color: kWhite,
                  ),
              text: 'Söwda başla',
              onPressed: onStartShop,
            ),
          ),
        ],
      ),
    );
  }
}
