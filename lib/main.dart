import 'dart:developer' as dev;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yes_demo/global_providers/brand_providers.dart';
import 'package:yes_demo/global_providers/promotion_provider.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/notification/notification_service.dart';
import 'firebase_learn/firebase_learn.dart';
import 'global_providers/category_provider.dart';
import 'login_learn/login_view.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/category/category_screen.dart';
import 'screens/home/home.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  tz.initializeTimeZones();
  NotificationService().initNotification();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.instance.getToken().then((value) => dev.log('$value'));
  _showNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
            create: ((_) => CategoryProvider())),
        ChangeNotifierProvider<BrandProvider>(
          create: ((_) => BrandProvider()),
        ),
        ChangeNotifierProvider<PromotionProvider>(
          create: ((_) => PromotionProvider()),
        ),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

void _showNotification() {
  FirebaseMessaging.onMessage.listen(
    (e) {
      dev.log("onMessage " + e.notification!.title.toString());
      NotificationService().showNotification(
          0, e.notification!.title!, e.notification!.body!, 2);
    },
    onError: (e) => dev.log(e.toString()),
    onDone: () {},
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {}
  return;
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 50,
          iconTheme: IconThemeData(color: text1Color),
          titleTextStyle: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentindex = 0;

  List<Widget> screens = [
    CartScreen(),
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
    FirebaseLearn()
  ];

  void getMessageOnTerminate() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (val) {
        if (val != null) {
          if (val.data['type'] == 'home') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else if (val.data['type'] == 'category') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CategoryScreen();
            }));
          } else if (val.data['type'] == 'firebase') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FirebaseLearn();
            }));
          }
        }
      },
    );
  }

  void getMessageOnForGround() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (mes) {
        dev.log('URAAAAA:  ' + mes.data['type'].toString());
        if (mes.data['type'] == 'firebase') {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FirebaseLearn();
          }));
        }
        dev.log(mes.data.toString());
      },
      onError: (e) => dev.log(e.toString()),
    );
  }

  @override
  void initState() {
    super.initState();
    getMessageOnTerminate();
    getMessageOnForGround();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) => setState(() => currentindex = i),
          currentIndex: currentindex,
          unselectedItemColor: text1Color,
          selectedItemColor: primaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category_rounded),
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_bag),
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shopping Bag',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ]),
    );
  }
}
