import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yes/presentation/shared/colors.dart';

class AppLoadingBar extends StatelessWidget {
  const AppLoadingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .12,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kWhite,
          shape: BoxShape.circle,
        ),
        child: SpinKitRing(
          color: kPrimaryColor,
          lineWidth: 4,
        ),
      ),
    );
  }
}
