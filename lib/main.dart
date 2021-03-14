import 'package:flutter/material.dart';
import 'package:ui/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:ui/pages/image_page.dart';
import 'package:ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      home: SplashPage(),
      routes: {
        ImagePage.routeName: (BuildContext context) => ImagePage(),
        HomePage.routeName: (_) => HomePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
