import 'package:flutter/material.dart';
import 'package:ui/pages/chat_page.dart';
import 'package:ui/pages/image_page.dart';
import 'package:ui/pages/posts_page.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/bottom_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/widgets/cronometer.dart';
import 'package:ui/widgets/my_appbar.dart';
import 'package:ui/widgets/my_btn.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
      bottomNavigationBar: BottomMenu(items: [
        BottomMenuItem(iconPath: 'assets/icons/home.svg', label: 'Inicio'),
        BottomMenuItem(iconPath: 'assets/icons/historial.svg', label: 'Historial'),
        BottomMenuItem(iconPath: 'assets/icons/ofertas.svg', label: 'Ofertas'),
        BottomMenuItem(iconPath: 'assets/icons/emoji.svg', label: 'Mi perfil')
      ],),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              MyAppBar(
                rightIcon: 'assets/icons/message.svg',
                leftIcon: 'assets/icons/camera.svg',
                onRightClick: (){
                  final route = MaterialPageRoute(builder: (BuildContext _)=> ChatPage(username: "Steven Andrade",));
                  Navigator.push(context, route);
                },
                onLeftClick: (){
                  Navigator.pushNamed(context, ImagePage.routeName, arguments: ImagesPageArgs(username: "Steven", isActive: true ));
                },
              ),
              Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              children: <Widget> [
              Avatar(),
              SizedBox(height: 20,),
              Text("Bienvenido"),
              Text("Steven Andrade Solórzano", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("Desarrrollador de Software"),
              Container(
                height: 1,
                width: 100,
                margin: EdgeInsets.symmetric(vertical:20),
                color: Colors.grey,
              ),
              _isEnabled == true ?
                  Cronometer(initTime: 10.0, fontSize: 40.0,) :
                  Container(),
              // CupertinoButton(
              //   onPressed: () {
              //     setState(() {
              //       _isEnabled = !_isEnabled;
              //     });
              //   },
              //   color: Colors.blue,
              //   child: Text("Enabled: $_isEnabled"),
              // ),
              MyBtn(
                label: 'My Posts',
                onPressed: (){
                  Navigator.pushNamed(context, PostsPage.routeName);
                },)
            ],
          )
              )
            ],
          )
        )
      )     
    );
  }
}