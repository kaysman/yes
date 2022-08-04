import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';
import 'package:yes/presentation/screens/profile/login/login.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'login/bottom_login_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    currentUser = AppService.currentUser.value;
    _loginBloc = LoginBloc(context.read<AuthBloc>());
  }

  late Client? currentUser;
  late LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: kWhite,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 17,
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            height: 100,
                          ),
                          Container(
                            color: kWhite,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[100]!, width: 2),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: BlocConsumer<AuthBloc, AuthState>(
                                listener: (_, state) {},
                                builder: (context, state) {
                                  print(state.status);
                                  print(state.identity);
                                  return state.status ==
                                                  AuthStatus.Authenticated &&
                                              state.identity != null ||
                                          currentUser != null
                                      ? ElevatedButton(
                                          onPressed: logOut,
                                          child: Text('Log out'))
                                      : GestureDetector(
                                          onTap: () {
                                            _showLoginBottomSheet(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: kPrimaryColor,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'LOG IN/SIGN UP ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kWhite,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomLoginSheet();
      },
    );
  }

  void logOut() async {
    await _loginBloc.logOut();
  }
}
