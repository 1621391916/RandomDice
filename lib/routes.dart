import 'package:flutter/material.dart';

import './pages/HomePage/HomePage.dart';
import './pages/CommunityPage/CommunityPage.dart';
import './pages/MyselfPage/MyselfPage.dart';
import './pages/HomePage/MatchGamePage.dart';
import './pages/HomePage/ChooseCharacterPage.dart';
import './pages/HomePage/CreateCharacterPage.dart';
import './pages/HomePage/CreateScriptPage.dart';

//配置路由,定义Map类型的routes,Key为String类型，Value为Function类型
final Map<String,Function> routes={
  '/home':(context)=>const HomePage(),
  '/community':(context)=>const CommunityPage(),
  '/myself':(context)=>const MyselfPage(),
  '/match':(context,{arguments})=>const MatchGamePage(),
  '/chooseCharacter': (context,{arguments})=>const ChooseCharacterPage(),
  '/createCharacter': (context,{arguments})=>const CreateCharacterPage(),
  '/createScript': (context,{arguments})=>const CreateScriptPage(),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      //String? 表示name为可空类型
      final String? name = settings.name;
      //Function? 表示pageContentBuilder为可空类型
      final Function? pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};

