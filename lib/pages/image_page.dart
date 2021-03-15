import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/widgets/my_appbar.dart';

class ImagesPageArgs{
  final String username;
  final bool isActive;

  ImagesPageArgs({@required this.username, @required this.isActive});
}

class ImagePage extends StatefulWidget {
  static final routeName = 'name';
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {

    // final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyAppBar(
                rightIcon: 'assets/icons/message.svg',
                leftIcon: 'assets/icons/camera.svg',
                onLeftClick: () => Navigator.pop(context),
              ),    
              // Expanded(child: Center(child: Text("${args.username} is active? ${args.isActive}"),)) 
              Expanded(
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        color: Colors.blue,
                        child: Image.asset(
                          'assets/arbol.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(child: 
                        Text('Steven', 
                          style: TextStyle(
                              fontSize: 30, 
                              color: Colors.green),
                        ), 
                        right: 30, bottom: 40,
                      )
                    ],
                  )
                )
              )         
            ],
          ),
        ),
      )
    );
  }
}