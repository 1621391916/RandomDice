import 'package:flutter/material.dart';

class MatchGamePage extends StatefulWidget {
  const MatchGamePage({Key? key}) : super(key: key);

  @override
  _MatchGamePageState createState() => _MatchGamePageState();
}

class _MatchGamePageState extends State<MatchGamePage> {

  @override
  Widget build(BuildContext context) {
    print('------main, ----build');
    return Scaffold(
      appBar: AppBar(
        title: Text("正在匹配"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Navigator.of(context).pop();
            },
          );
        }),
      ),
      body: const Center(
        child: Text('匹配中'),
    ),
    );
  }
}
