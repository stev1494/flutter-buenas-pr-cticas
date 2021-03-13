import 'package:flutter/material.dart';
import 'package:ui/widgets/circle_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mi app")),
      ),
      body: Center(
        child: CircleContainer(
          child:Text('Hola', style: TextStyle(fontSize: 50),),
          width: 100,
          height: 4,
        )
      )      
    );
  }
}