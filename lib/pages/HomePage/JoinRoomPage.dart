import 'package:flutter/material.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({Key? key}) : super(key: key);

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = SizedBox(
      width: 300,
      height: 600,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                color: Colors.white,
                borderRadius: BorderRadius.circular((0)),
              ),
              child: const TextField(
                autofocus: true,
                decoration: InputDecoration(
                  // labelText: "输入标题，2-30字",
                  hintText: "输入房间号",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  // prefixIcon: Icon(Icons.person)
                ),
              ),
            )
          ),
          // const Spacer(flex: 6,),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                  onPressed: () { Navigator.pushNamed(context, '/chooseCharacter'); },
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.green[500]),
                      minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
                      ),
                    ),
                    child: const Text('搜索'),
                  ),
                )
              ],
            )
          )
        ],
      )
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("剧本投稿"),
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
      resizeToAvoidBottomInset: false,
      body: Center(child: mainBody,)
    );
  }
}
