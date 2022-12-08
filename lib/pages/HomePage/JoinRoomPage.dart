import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({Key? key}) : super(key: key);

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      // width: 300,
      // height: 600,
      child: Column(
        children: [
          Spacer(flex: 2,),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 20,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black26),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular((22)),
              ),
              child: const TextField(
                // textAlign: TextAlign.center,
                autofocus: false,
                decoration: InputDecoration(
                  // labelText: "输入标题，2-30字",
                  hintText: "输入房间号",
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  prefixIcon: Icon(Icons.person)
                ),
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            )
          ),
          const Spacer(flex: 3,),
          Expanded(
            flex: 2,
            child: Container(
              // margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, '/chooseCharacter'); },
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                  backgroundColor: MaterialStateProperty.all(Colors.green[500]),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
                  ),
                  elevation: MaterialStateProperty.all(6)
                ),
                child: const Text('搜索'),
              ),
            )
          ),
          const Spacer(flex: 1,),
        ],
      )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("搜索房间"),//, style: TextStyle(color: Colors.black),),
        centerTitle: true,
        // backgroundColor: Colors.lightGreen[400],//Colors.transparent,
        // elevation: 5,
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
