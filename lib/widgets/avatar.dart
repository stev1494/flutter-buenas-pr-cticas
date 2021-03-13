import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui/widgets/circle_container.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.white,
      child: Stack(
        children: [
          SvgPicture.network('https://www.flaticon.es/svg/vstatic/svg/1177/1177568.svg?token=exp=1615675566~hmac=3c9c07b334ec03319bc71614adcefd25'),
          Positioned(
            child: CircleContainer(
              child: Icon(Icons.edit),
              size: 60,
            ),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
}