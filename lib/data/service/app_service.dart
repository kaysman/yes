import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/main.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/category/category.bloc.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/index/index.bloc.dart';
import 'package:yes/presentation/shared/storage.dart';

import '../../presentation/screens/cart/order/order.bloc.dart';
import '../../presentation/screens/cart/widgets/wishlist/bloc/wishList.bloc.dart';
import '../../presentation/screens/profile/login/login.bloc.dart';
import '../models/client/client.model.dart';

class AppService {
  static ValueNotifier<Client?> currentUser = ValueNotifier<Client?>(null);

  AppService._setEnvironment();

  static final instance = AppService._setEnvironment();

  startApp() async {
    // register all blocs here...
    AuthBloc authBloc = AuthBloc();
    LoginBloc loginBloc = LoginBloc(authBloc);
    CartBloc cartBloc = CartBloc();

    var storage = (await LocalStorage.instance);
    if (storage.getToken != null && storage.getClient != null) {
      currentUser.value = (await LocalStorage.instance).getClient;
      print(currentUser.value);
      print(storage.getToken);
    }

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<IndexBloc>(create: (_) => IndexBloc()),
          BlocProvider<AuthBloc>(create: (_) => authBloc),
          BlocProvider<LoginBloc>(create: (_) => loginBloc),
          BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
          BlocProvider<CategoryCubit>(create: (_) => CategoryCubit()),
          BlocProvider<CartBloc>(create: (_) => cartBloc),
          BlocProvider<WishListBloc>(create: (_) => WishListBloc(cartBloc)),
          BlocProvider<OrderBloc>(create: (_) => OrderBloc()),
        ],
        child: YesApp(),
      ),
    );
  }
}
