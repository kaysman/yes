import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/index/index_screen.dart';

import 'presentation/shared/theming.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YES',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: YESApp(),
    );
  }
}
