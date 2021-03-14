import 'package:after_layout/after_layout.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/widgets/circle_container.dart';


class Cronometer extends StatefulWidget{
  final double initTime, fontSize;
  const Cronometer({Key key, this.initTime=0, this.fontSize}) : super(key: key);

  @override
  CronometerState createState() => CronometerState();
}

class CronometerState extends State<Cronometer> with AfterLayoutMixin{
  double _time;
  Timer _timer;

  
  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(title: Text("AfterFirstLayout"),);
    });
  }

  @override
  void initState() {
    super.initState();
    _time= widget.initTime;
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  void _start() {
    _timer = Timer.periodic(Duration(seconds:1), (Timer _) { 
      setState(() {
        _time++;
      });
    });
  }

  void _stop() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(_time.toString(), style: TextStyle(fontSize: widget.fontSize)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: _start,
                child: CircleContainer(child: Icon(Icons.play_arrow), size: 55,),
              ),
              CupertinoButton(
                onPressed: _stop,
                child: CircleContainer(child: Icon(Icons.stop), size: 55,),
              ),
            ],
          )
        ],
      ),
    );
  }


}