import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Spacer(flex: 1,),
          Expanded(
            flex: 1,
            child: Text(
              '房间号：8888888',
              // textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                height: 1.2,
                fontFamily: "Courier",
                // decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Text(
              '剧本：123',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                height: 1.2,
                fontFamily: "Courier",
                // decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            )
          ),
          Expanded(flex: 10, child: RoomMemberList()),
          Expanded(flex: 1, child: StartGameButton()),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("房间"),
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

class RoomMemberList extends StatefulWidget {
  const RoomMemberList({Key? key}) : super(key: key);

  @override
  State<RoomMemberList> createState() => _RoomMemberListState();
}

class _RoomMemberListState extends State<RoomMemberList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      // itemExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return RoomMemberUnit(
          avatar: getImageFromPathOrUrl('assets/avatars/avatar1.png'),
          name: '角色${index+1}',
        );
      }
    );
  }
}


class RoomMemberUnit extends StatefulWidget {
  dynamic avatar;
  String name;

  RoomMemberUnit({
    Key? key,
    required this.avatar,
    required this.name,
  }) : super(key: key);

  @override
  State<RoomMemberUnit> createState() => _RoomMemberUnitState();
}

class _RoomMemberUnitState extends State<RoomMemberUnit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular((10)),
      ),
      margin: const EdgeInsets.only(bottom: 10.0, left: 5, right: 5),
      // padding: const EdgeInsets.only(left: 0.0, bottom: 0),
      height: 80.0,
      child: Row(
        children: [
          const Spacer(flex: 1,),
          Expanded(
            flex: 5,
            child: Image(
              image: widget.avatar,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            )
          ),
          const Spacer(flex: 1,),
          Expanded(
            flex: 15,
            child: Text(widget.name)
          ),
        ]
      ),
    );
  }
}

class StartGameButton extends StatefulWidget {
  const StartGameButton({Key? key}) : super(key: key);

  @override
  State<StartGameButton> createState() => _StartGameButtonState();
}

class _StartGameButtonState extends State<StartGameButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton(
      onPressed: () {},
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
          backgroundColor: MaterialStateProperty.all(Colors.green[500]),
          minimumSize: MaterialStateProperty.all(const Size(200, 200)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
          ),
        ),
        child: const Text('开始游戏'),
      ),
    );
  }
}
