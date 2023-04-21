import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override                           // build fn is over written again and again to implement the changes
  Widget build(BuildContext context) { //context specify location of each widget in widget tree
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        ),
         initialRoute: "/home", //this is the 1st route we want to show on screen when app opens
        routes: {
          "/":(context) => LoginPage(), //by default initial route is /
          "/home":(context) => HomePage(),
          "/login": (context) =>LoginPage(),
        },
    );
  }
}
