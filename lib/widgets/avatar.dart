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
          SvgPicture.asset('assets/icons/user.svg'),
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