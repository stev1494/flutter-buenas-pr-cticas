import 'package:flutter/material.dart';
import 'package:ui/widgets/my_appbar.dart';

class PostsPage extends StatefulWidget {
  static final routeName = 'posts';
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<String> _data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyAppBar(
                rightIcon: 'assets/icons/points.svg',
                leftIcon: 'assets/icons/back.svg',
                onLeftClick: () {
                  Navigator.pop(context);
                },
                onRightClick: (){
                  setState(() {
                    // _data.add("item ${_data.length}");  
                    _data.insert(_data.length > 0 ? _data.length - 1 : 0, "item before ${_data.length}");  
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    final String item = _data[position];
                    return ListTile(
                      title: Text(item),
                      subtitle: Text(DateTime.now().toString()),
                      leading: Icon(Icons.wallet_giftcard),
                      onTap: (){},
                      onLongPress: (){    
                        setState(() {
                          _data.removeAt(position);
                        });
                      },
                    );
                  },
                  itemCount: _data.length,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}