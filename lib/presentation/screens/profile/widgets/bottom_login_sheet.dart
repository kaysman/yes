import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/validators.dart';


class BottomLoginSheet extends StatelessWidget {
  const BottomLoginSheet({Key? key}) : super(key: key);

  void _close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 30,
          bottom: 30 + MediaQuery.of(context).viewInsets.bottom,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.deepOrange, shape: BoxShape.circle),
                  child: const Text(
                    'YES.',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.2),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _close(context);
                  },
                  child: Container(child: Icon(Icons.close)),
                )
              ],
            ),
            SizedBox(height: 20),
            BootmSheetLogin(),
          ],
        ),
      ),
    );
  }
}

class BootmSheetLogin extends StatefulWidget {
  const BootmSheetLogin({Key? key}) : super(key: key);

  @override
  State<BootmSheetLogin> createState() => BootmSheetLoginState();
}

class BootmSheetLoginState extends State<BootmSheetLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  get _phoneFieldPrefixIcon {
    return Container(
      width: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12),
          Text(
            '+993',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(width: 5),
          SizedBox(
            height: 48,
            child: VerticalDivider(
              indent: 10,
              endIndent: 10,
              width: 1,
              thickness: 0.6,
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Login',
                          style: LoginStyleUtils().blueTextBold,
                          children: [
                            TextSpan(
                                text: '  or  ',
                                style: Theme.of(context).textTheme.bodyText1),
                            TextSpan(
                              text: 'Signup',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
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
                              Text('Mobile Number',
                                  style: LoginStyleUtils().labelText),
                              Positioned(
                                top: 0,
                                right: -10,
                                child: Text('*',
                                    style: LoginStyleUtils().pinkText),
                              ),
                            ],
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black38,
                        )),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        )),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        )),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        prefixIcon: this._phoneFieldPrefixIcon,
                      ),
                      validator: phoneValidator,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: 'By continuing, I agree to the',
                      style: LoginStyleUtils().defText,
                      children: [
                        TextSpan(
                          text: ' Terms of Use',
                          style: LoginStyleUtils().pinkTextBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("entered");
                            },
                        ),
                        TextSpan(text: ' &'),
                        TextSpan(
                          text: ' Privacy Piolicy',
                          style: LoginStyleUtils().pinkTextBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("entered");
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onTap,
                      child: Text('CONTINUE', style: LoginStyleUtils().btnText),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Having trouble logging in? ',
                        style: Theme.of(context).textTheme.bodyText2,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Get help',
                            style: LoginStyleUtils().pinkText,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("entered");
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (_formKey.currentState?.validate() == true) {
      // logic
    }
  }
}

class LoginStyleUtils {
  TextStyle pinkTextBold =
      const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold);
  TextStyle blueTextBold = const TextStyle(
      color: kText1Color, fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle defText = const TextStyle(
    color: kText1Color,
    fontSize: 14,
  );
  TextStyle pinkText = const TextStyle(
    color: Colors.pinkAccent,
  );
  TextStyle labelText =
      TextStyle(letterSpacing: .15, fontSize: 13, color: kText2Color);
  TextStyle btnText = const TextStyle(
      fontSize: 15, color: kWhite, fontWeight: FontWeight.w500);
}
