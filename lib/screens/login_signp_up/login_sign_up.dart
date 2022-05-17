import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes_demo/helpers/colors.dart';

import '../../widgets/bottom_login_sheet.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: grey1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 300,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Image.asset('assets/login.png')),
          ),
          Expanded(flex: 4, child: BootmSheetLogin()),
          const Spacer(
            flex: 1,
          )
        ]),
      ),
    );
  }
}
