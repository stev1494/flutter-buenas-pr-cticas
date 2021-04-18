import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/api/account_api.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/circle_container.dart';
import 'package:shimmer/shimmer.dart';




class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isEnabled = false;
  int _currentPage = 0;

  AccountApi _accountApi = AccountApi();
  List<dynamic> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  _load() async {
    final users = await _accountApi.getUsers();
    setState(() {
      _users.addAll(users);
      _isLoading = false;
    });
  }

  Widget _shimmer() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (_ , index) {
          return Shimmer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 80),
                child: Column(
                children: [
                  Container( 
                  width: 70, 
                  height: 70, 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffcccccc),
                  ),),
                  SizedBox(height: 3,),
                  Container(width: 50, height: 13, color: Colors.white)
                ],
          ),
              ),
            ),
          gradient: LinearGradient(colors: [Colors.white, Color(0xfff0f0f0)])
          );
        }, 
        itemCount: 7, 
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

      _isLoading ?
      _shimmer() :
      Container(
        height: 110,
        child: ListView.builder(
          itemBuilder: (_, index){
            final dynamic item = _users[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget> [
                  Expanded(child: ClipOval(
                    child: Image.network(item['avatar']),
                  ),),
                  Text(item['first_name'])
                  
                ],
              ),
            );
          },
          itemCount: _users.length,
          scrollDirection: Axis.horizontal,),
      ),
      ],
    );
  }
}