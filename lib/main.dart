import 'package:flutter/material.dart';
import 'package:yes/data/service/app_service.dart';

import 'package:yes/presentation/screens/index/index_screen.dart';
import 'package:yes/presentation/shared/network-change-manager/network-change-view.dart';

import 'presentation/shared/routes.dart';
import 'presentation/shared/theming.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppService.instance.startApp();
}

// TODO: extended_image: ^6.2.1 use this for cahce image...

class YesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YES',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      initialRoute: IndexScreen.routeName,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      builder: (_, child) => NetworkChecker(child: child),
    );
  }
}

class NetworkChecker extends StatelessWidget {
  const NetworkChecker({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? SizedBox(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: NoNetworkWidget(),
        )
      ],
    );
  }
}
