import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override // build fn is over written again and again to implement the changes
  Widget build(BuildContext context) {
    //context specify location of each widget in widget tree
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.lighttheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute:
          "/home", //this is the 1st route we want to show on screen when app opens
      routes: {
        "/": (context) => LoginPage(), //by default initial route is "/"
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      }, 
    );
  }
}
