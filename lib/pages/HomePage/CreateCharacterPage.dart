import 'package:flutter/material.dart';

class CreateCharacterPage extends StatefulWidget {
  const CreateCharacterPage({Key? key}) : super(key: key);

  @override
  State<CreateCharacterPage> createState() => _CreateCharacterPageState();
}

class _CreateCharacterPageState extends State<CreateCharacterPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(

    );
    return Scaffold(
      appBar: AppBar(
        title: Text("创建角色"),
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
      body: mainBody
    );
  }
}

