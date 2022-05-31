import 'package:flutter/material.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';
import 'package:yes/presentation/shared/widgets/app_observer.dart';

import 'presentation/shared/routes.dart';
import 'presentation/shared/theming.dart';

void main() {
  AppService.instance.startApp();
}

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
      builder: (context, home) => AppObserver(child: home),
    );
  }
}
