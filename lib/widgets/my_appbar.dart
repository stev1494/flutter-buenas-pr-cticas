import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: (){},
            padding: EdgeInsets.all(15),
            child: SvgPicture.network(
              'https://www.flaticon.es/svg/vstatic/svg/685/685672.svg?token=exp=1615689059~hmac=24c78ca5d53ccb67a4f9d1365f7d2164',
              width: 40,
            ),
          ),
          Text("LOGO",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          CupertinoButton(
            onPressed: (){},
            padding: EdgeInsets.all(15),
            child: Stack(
              children: [
               Padding(padding: EdgeInsets.all(15),
               child:  SvgPicture.network(
                 'https://www.flaticon.com/svg/vstatic/svg/1370/1370907.svg?token=exp=1615689660~hmac=5c07815286290a30dc18eb24e22a7ab2',
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