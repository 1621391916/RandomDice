import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'pages/HomePage/HomePage.dart';
import 'pages/CommunityPage/CommunityPage.dart';
import 'pages/MyselfPage/MyselfPage.dart';
import 'routes.dart';
// import 'package:stack_trace/stack_trace.dart';

void main() => runApp(MyApp());
// void main() => Future.delayed(Duration(seconds: 1)).then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        // fontFamily: 'HuaKangHeiTi'
      ),
      home: const MainFunc(title: 'Flutter Demo Home Page'),
      // initialRoute: '/home',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute

    );
  }
}

class MainFunc extends StatefulWidget {
  const MainFunc({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MainFuncState createState() => _MainFuncState();
}

class _MainFuncState extends State<MainFunc> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const CommunityPage(),
    const MyselfPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _tabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color(0xECDAD8D8),
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0, spreadRadius: 2.0
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          child: GNav(
            style: GnavStyle.google,
            tabBackgroundGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[300]!,
                Colors.lightGreen,
                Colors.lightGreen[500]!,
              ]
            ),
            gap: 8,
            tabBorderRadius: 12,
            color: Colors.grey[600],
            activeColor: Colors.white,
            iconSize: 20,
            textStyle: const TextStyle(fontSize: 12, color: Colors.white),
            tabBackgroundColor: Colors.grey[800]!,
            padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            duration: const Duration(milliseconds: 200),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: '首页',
              ),
              GButton(
                icon: LineIcons.userFriends,
                text: '社区',
              ),
              // GButton(
              //   icon: LineIcons.search,
              //   text: 'Search',
              // ),
              GButton(
                icon: LineIcons.user,
                text: '我的',
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: _tabChanged,
          ),
        ),
      ),
    );
  }
}