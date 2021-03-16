import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/cronometer.dart';
import 'package:ui/widgets/my_btn.dart';

import '../posts_page.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isEnabled = false;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints){
          return SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xfff0f0f0),
              height: constraints.maxHeight * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(
                    size: constraints.maxHeight * 0.25,
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
            SizedBox(height: 10,),
            Container(
              height: 120,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.all(5),
                    color: Colors.black12,
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 120,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.all(5),
                    color: Colors.black12,
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 120,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.all(5),
                    color: Colors.black12,
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            )
            // _isEnabled == true ?
            //     Cronometer(initTime: 10.0, fontSize: 40.0,) :
            //     Container(),
            //       CupertinoButton(
            //         onPressed: () {
            //           setState(() {
            //             _isEnabled = !_isEnabled;
            //           });
            //         },
            //         color: Colors.blue,
            //         child: Text("Enabled: $_isEnabled"),
            //       ),
            // MyBtn(
            //   label: 'My Posts',
            //   onPressed: (){
            //   Navigator.pushNamed(context, PostsPage.routeName);
            //   },
            // )
          ],
        ),
          );
        } ,     
      ),
    );
  }
}