import 'package:bringo_restaurants/pages/auth_screen.dart';
import 'package:bringo_restaurants/pages/drawer_screen.dart';
import 'package:bringo_restaurants/pages/getuserphone_screen.dart';
import 'package:bringo_restaurants/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MenuProvider(),
            child: DrawerScreen(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  body1: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  body2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  title: TextStyle(
                      fontSize: 16,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,),
                ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => AuthScreen(),
            DrawerScreen.routeName: (context) => DrawerScreen(),
            ProfileScreen.routeName: (context) => ProfileScreen(),
            UserPhoneScreen.routeName: (context) => UserPhoneScreen(),
          },
        ),
      ),
    );
  }
}
