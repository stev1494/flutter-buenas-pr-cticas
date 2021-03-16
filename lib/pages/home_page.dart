import 'package:flutter/material.dart';
import 'package:ui/pages/chat_page.dart';
import 'package:ui/pages/image_page.dart';
import 'package:ui/pages/page_home_tabs/history_tab.dart';
import 'package:ui/pages/page_home_tabs/home_tab.dart';
import 'package:ui/pages/page_home_tabs/more_tab.dart';
import 'package:ui/pages/page_home_tabs/oferts_tab.dart';
import 'package:ui/pages/posts_page.dart';
import 'package:ui/widgets/avatar.dart';
import 'package:ui/widgets/bottom_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/widgets/cronometer.dart';
import 'package:ui/widgets/my_appbar.dart';
import 'package:ui/widgets/my_btn.dart';
import 'package:ui/widgets/my_page_view.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  // PageController _pageViewController;

  final _menu = [
          BottomMenuItem(iconPath: 'assets/icons/home.svg', label: 'Inicio', content: HomeTab()),
          BottomMenuItem(iconPath: 'assets/icons/historial.svg', label: 'Historial', content: HistoryTab()),
          BottomMenuItem(iconPath: 'assets/icons/ofertas.svg', label: 'Ofertas', content: OfertsTab()),
          BottomMenuItem(iconPath: 'assets/icons/emoji.svg', label: 'Mi perfil', content: MoreTab())
      ];

  @override
  void initState() {
    super.initState();
     //_pageViewController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  void dispose() {
    // _pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage){
          // _pageViewController.jumpToPage(newCurrentPage);
          setState(() {
            _currentPage = newCurrentPage;
          });
        },
        items: _menu,),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              MyAppBar(
                rightIcon: 'assets/icons/message.svg',
                leftIcon: 'assets/icons/camera.svg',
                onRightClick: (){
                  final route = MaterialPageRoute(builder: (BuildContext _)=> ChatPage(username: "Steven Andrade",));
                  Navigator.push(context, route);
                },
                onLeftClick: (){
                  Navigator.pushNamed(context, ImagePage.routeName, arguments: ImagesPageArgs(username: "Steven", isActive: true ));
                },
              ),
              Expanded(
                // PageView.builder(
                //   controller: _pageViewController,
                //   onPageChanged: (int newPage){
                //     setState(() {
                //       _currentPage = newPage;
                //     });
                //   },
                //   itemBuilder: (context, index){
                //   return _menu[index].content;
                // },
                // itemCount: 4,)
                child: MyPageView(
                  children: _menu.map((item) => item.content).toList(),
                  currentPage: _currentPage,
                )
              )
            ],
          )
        )
      )     
    );
  }
}