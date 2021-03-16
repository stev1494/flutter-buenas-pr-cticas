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
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemBuilder: (_, index){
                     return Container(
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: Text("${index + 1}"),
                     );
                    },
                    itemCount: 100,
                ), 
              ),         
            ],
          ),
        ),
      )
    );
  }
}