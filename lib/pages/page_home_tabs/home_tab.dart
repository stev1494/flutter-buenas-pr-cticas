import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/api/account_api.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/circle_container.dart';


class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isEnabled = false;
  int _currentPage = 0;

  AccountApi _accountApi = AccountApi();
  List<dynamic> _users = [];

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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