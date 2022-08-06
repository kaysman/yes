import 'package:flutter/material.dart';
import 'package:yes/data/service/app_service.dart';

import 'package:yes/presentation/screens/index/index_screen.dart';

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
    );
  }
}
