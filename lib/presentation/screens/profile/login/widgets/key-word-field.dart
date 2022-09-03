import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/profile/login/bottom_login_sheet.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/validators.dart';

class KeyWordField extends StatelessWidget {
  const KeyWordField({Key? key, required this.keywordController})
      : super(key: key);
  final TextEditingController keywordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: keywordController,
        validator: keyWordValidator,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text('Key word', style: LoginStyleUtils().labelText),
                Positioned(
                  top: 0,
                  right: -10,
                  child: Text('*', style: LoginStyleUtils().pinkText),
                ),
              ],
            ),
          ),
          enabledBorder: kEnabledInputBorder,
          focusedBorder: kFocusedInputBorder,
          errorBorder: kErrorInputBorder,
          focusedErrorBorder: kErrorInputBorder,
        ),
      ),
    );
  }
}
