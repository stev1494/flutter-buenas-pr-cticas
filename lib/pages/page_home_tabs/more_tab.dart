import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/pages/login_page.dart';
import 'package:ui/utils/dialogs.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/left_right_icon_button.dart';

class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {

  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (_) => false);
  }

  _confirm() async {
   final isOk = await Dialogs.confirm(
    context, 
    title: "ACCIÓN REQUERIDA",
    body: "¿Está seguro que desea salir de su cuenta?"
   );
   if(isOk) {
     _logOut();
   }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30 ),
              width: double.infinity,
              color: Color(0xfff0f0f0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(
                    size: 150,
                  ),
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
                ],
              )
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icons/logout.svg',
              label: 'Cerrar Sesión',
              onPressed: _confirm,
            )
          ],
        ),
      )
    );
  }
}