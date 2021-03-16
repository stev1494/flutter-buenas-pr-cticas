import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui/widgets/circle_container.dart';

class Avatar extends StatefulWidget {
  final double size;

  const Avatar({Key key, this.size = 150}) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  File _file;
  final picker = ImagePicker();

  _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _file = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      color: Color(0xfff0f0f0),
      child: Stack(
        children: [
          _file == null 
             ? SvgPicture.asset('assets/icons/user.svg') 
             : ClipRRect(
               borderRadius: BorderRadius.circular(100),
               child:Image.file(_file, fit: BoxFit.cover, width: 200, height: 200)
             ),
          Positioned(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _pickImage(),
              child: CircleContainer(
                child: Icon(Icons.edit),
                size: 60,
               ),
            ),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
}