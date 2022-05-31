import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/main.dart';
import 'package:yes/presentation/screens/index/index.bloc.dart';

class AppService {
  AppService._setEnvironment();

  static final instance = AppService._setEnvironment();

  startApp() async {
    // register all blocs here...

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<IndexBloc>(create: (_) => IndexBloc()),
        ],
        child: YesApp(),
      ),
    );
  }
}
