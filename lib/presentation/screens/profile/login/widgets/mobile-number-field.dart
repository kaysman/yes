import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes/presentation/screens/profile/login/bottom_login_sheet.dart';
import 'package:yes/presentation/screens/profile/login/widgets/phone-field-prefix.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/validators.dart';

class MobileNumberField extends StatelessWidget {
  MobileNumberField({Key? key, required this.phoneNumberController})
      : super(key: key);

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: phoneNumberController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text('Mobile Number', style: LoginStyleUtils().labelText),
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
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          prefixIcon: PhoneFieldPrefix(),
        ),
        validator: phoneValidator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
      ),
    );
  }
}
