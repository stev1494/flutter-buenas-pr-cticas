import 'package:flutter/material.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/bottom_menu.dart';
import 'package:ui/widgets/circle_container.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
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
              CupertinoButton(
                child: Text("UPLOAD"),
                color: Colors.blue,
                minSize: 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
                onPressed: () => print("uploading"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleContainer(child: Icon(Icons.add), size: 55,),
                  SizedBox(width: 20,),
                  CircleContainer(child: Icon(Icons.remove), size: 55),
              ],)
            ],
          )
        )
      )     
    );
  }
}