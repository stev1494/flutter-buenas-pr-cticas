import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {

  final Widget child;
  final double width, height;

  // utilizar assert es una buena práctica, para lanzar excepciones
  CircleContainer({@required this.child, @required this.height, @required this.width})
    : assert( child != null),
      assert( width!= null && width>=100),
      assert( height != null);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: Center(child: this.child),
              decoration: BoxDecoration(
                color: Color(0xfff0f0f0),
                //borderRadius: BorderRadius.circular(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(5,5)
                  )
                ]
            ),
          );
  }
}