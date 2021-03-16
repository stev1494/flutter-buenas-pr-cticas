import 'package:flutter/material.dart';
import 'package:ui/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:ui/pages/image_page.dart';
import 'package:ui/pages/login_page.dart';
import 'package:ui/pages/posts_page.dart';
import 'package:ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GestureDetector(
      // Esto lo hacemos para simular el comportamiento de cerrar teclados, como en iOS
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UI',
        home: SplashPage(),
        routes: {
          ImagePage.routeName: (BuildContext context) => ImagePage(),
          HomePage.routeName: (_) => HomePage(),
          PostsPage.routeName: (_) => PostsPage(),
          LoginPage.routeName: (_) => LoginPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
