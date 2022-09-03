import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';
import 'package:yes/presentation/screens/category/category_screen.dart';
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

  // late Client? currentUser;
  late String? currentUser;
  late LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: .6,
        backgroundColor: kWhite,
        title: AppBarTitle(title: 'Profile'),
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
                            color: Color.fromARGB(255, 45, 67, 86),
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
                                color: kGrey5Color,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Icon(
                                CupertinoIcons.person,
                                // color: kGrey1Color,
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
                                  return state.status ==
                                              AuthStatus.Authenticated ||
                                          currentUser != null
                                      ? ElevatedButton(
                                          onPressed: logOut,
                                          child: Text('Log out'))
                                      : GestureDetector(
                                          onTap: () {
                                            showLoginBottomSheet(context);
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
                SizedBox(
                  height: 14,
                ),
                Container(
                  color: kWhite,
                  child: Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            minLeadingWidth: 20,
                            leading: Icon(CupertinoIcons.cube_box),
                            title: Text(
                              'Orders',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: kText2Color),
                            ),
                            subtitle: Text(
                              'Check your order status',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontSize: 12),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await _loginBloc.logOut();
  }
}

showLoginBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return BottomLoginSheet();
    },
  );
}
