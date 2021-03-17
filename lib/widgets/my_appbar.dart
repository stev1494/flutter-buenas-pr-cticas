import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {

  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;

  const MyAppBar({Key key, @required this.leftIcon, @required this.rightIcon, this.onLeftClick, this.onRightClick}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: onLeftClick,
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(
              leftIcon,
              width: 40,
            ),
          ),
          Image.network('https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png', width: 170, color: Colors.blue,),
          CupertinoButton(
            onPressed: onRightClick,
            padding: EdgeInsets.all(15),
            child: Stack(
              children: [
               Padding(padding: EdgeInsets.all(15),
               child:  SvgPicture.asset(
                 rightIcon,
                  width: 30,
                   ),
              ),
              Positioned(
                right: 12,
                top:12,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.red, 
                    shape: BoxShape.circle
                  ),
                )
              )
             ],
           )
          ),
        ],
      ),
    );
  }
}