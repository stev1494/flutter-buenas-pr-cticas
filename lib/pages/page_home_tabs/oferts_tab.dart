import 'package:flutter/material.dart';

class OfertsTab extends StatefulWidget {
  @override
  _OfertsTabState createState() => _OfertsTabState();
}

class _OfertsTabState extends State<OfertsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints){
          return SingleChildScrollView(
            child: Column(
            children: [
              Container(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(5),
                      color: Colors.black12,
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        );
      } ,     
    ),
  );
  }
}