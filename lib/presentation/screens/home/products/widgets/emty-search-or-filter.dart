import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/components/buttons.dart';

class EmptySearchOrFilterView extends StatelessWidget {
  const EmptySearchOrFilterView({Key? key, required this.onTryAgain})
      : super(key: key);
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Image.asset(
            'assets/res.png',
            width: MediaQuery.of(context).size.width * .85,
            height: MediaQuery.of(context).size.height * .2,
          ),
          SizedBox(
            height: 14,
          ),
          Text('Siziň gözlegiňize degişli haryt tapylmady!'),
          SizedBox(
            height: 14,
          ),
          Button(
            text: 'Gaýtadan synanyşyň',
            onPressed: onTryAgain,
            hasBorder: true,
          )
        ],
      ),
    );
  }
}
