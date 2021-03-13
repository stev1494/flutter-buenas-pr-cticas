import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/widgets/circle_container.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: Text("Holaa"),
          alignment: Alignment.bottomCenter,
        )
      )     
    );
  }
}