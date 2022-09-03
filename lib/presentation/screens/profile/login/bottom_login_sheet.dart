import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/auth/login_request.model.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';
import 'package:yes/presentation/screens/profile/login/login.bloc.dart';
import 'package:yes/presentation/screens/profile/login/widgets/key-word-field.dart';
import 'package:yes/presentation/screens/profile/login/widgets/mobile-number-field.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'package:yes/presentation/shared/helpers.dart';

class BottomLoginSheet extends StatefulWidget {
  const BottomLoginSheet({Key? key}) : super(key: key);

  @override
  State<BottomLoginSheet> createState() => _BottomLoginSheetState();
}

class _BottomLoginSheetState extends State<BottomLoginSheet> {
  late LoginBloc _loginBloc;
  late AuthBloc authBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  final keyWordController = TextEditingController();

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    keyWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status == AuthStatus.Authenticated) {
          _close(context);
          showSnackBar(
            context,
            Text('Iceri girdiniz!'),
            type: SnackbarType.success,
          );
        }
      },
      builder: (context, state) {
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
                buildHeader(context),
                SizedBox(height: 20),
                Form(
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
                              buildTitle(context),
                              SizedBox(height: 16),
                              MobileNumberField(
                                phoneNumberController: phoneNumberController,
                              ),
                              SizedBox(height: 16),
                              KeyWordField(
                                keywordController: keyWordController,
                              ),
                              SizedBox(height: 16),
                              buildPrivacy(),
                              SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: BlocBuilder<LoginBloc, LoginState>(
                                  bloc: _loginBloc,
                                  builder: (context, state) {
                                    return Button(
                                      text: 'CONTINUE',
                                      textColor: kWhite,
                                      isLoading:
                                          state.status == LoginStatus.loading,
                                      onPressed: onLogin,
                                      primary: kPrimaryColor,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 12),
                              buildGetHelp(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  buildHeader(BuildContext context) {
    return Row(
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
              letterSpacing: -1.2,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _close(context);
          },
          child: Container(child: Icon(Icons.close)),
        )
      ],
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: 'Login',
            style: LoginStyleUtils().blueTextBold,
            children: [
              TextSpan(
                  text: '  or  ', style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                text: 'Signup',
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildGetHelp(BuildContext context) {
    return Align(
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
    );
  }

  buildPrivacy() {
    return RichText(
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
            text: ' Privacy Policy',
            style: LoginStyleUtils().pinkTextBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("entered");
              },
          ),
        ],
      ),
    );
  }

  onLogin() async {
    if (_formKey.currentState!.validate()) {
      LoginDTO data = LoginDTO(
        password: keyWordController.text.trim(),
        phoneNumber: "+993" + phoneNumberController.text.trim(),
      );
      await _loginBloc.login(data);
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
  TextStyle btnText =
      const TextStyle(fontSize: 15, color: kWhite, fontWeight: FontWeight.w500);
}
