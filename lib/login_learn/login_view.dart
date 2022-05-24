import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/helpers/validators.dart';
import 'package:yes_demo/login_learn/model/token_model.dart';
import 'package:yes_demo/models/product_model.dart';
import 'package:yes_demo/screens/home/home.dart';

import 'model/login_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  void changeLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  String? token = '';

  Future<void> login(LoginModel model) async {
    changeLoading(true);
    final res =
        await Dio().post('https://reqres.in/api/login', data: model.toJson());
    if (res.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));
      final pref = await SharedPreferences.getInstance();
      final tokenM = TokenModel.fromJson(res.data);
      pref.setString('token', tokenM.token ?? '');
    }
    changeLoading(false);
  }
  //  setState(() {
  //       token= pref.getString('token');
  //     });

  Future<void> getToken() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        token = pref.getString('token');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your are logged in, your token is $token',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitHourGlass(color: primaryColor),
            )
          : Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: text1Color)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: text1Color)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                          ),
                          validator: emailValidator),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        // validator: passwordValidator,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: text1Color)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: text1Color)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      if (formKey.currentState!.validate()) {
                                        final data = LoginModel(
                                            _emailController.text.trim(),
                                            _passwordController.text.trim());

                                        await login(data);
                                      }
                                    },
                              child: Text('Login')),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor),
                              onPressed: () async {
                                final pref =
                                    await SharedPreferences.getInstance();
                                if (pref.remove('token') == true) {
                                  setState(() {
                                    token = '';
                                  });
                                }
                                ;
                              },
                              child: Text('Remove token'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
