import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/widgets/circle_container.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mi app")),
      ),
      body: Center(
        child: CircleContainer(
          child: SvgPicture.asset(
            'assets/icons/lista.svg', 
             width: 40, 
             height: 40, 
             color: Colors.blueAccent,
            ),
          width: 100,
          height: 100,
        )
      )      
    );
  }
}