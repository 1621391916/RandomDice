import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  @override
  Widget build(BuildContext context) {
    Widget roomNumWidget(String num) {
      return Row(
        children: List.generate(num.length, (index) => Container(
          width: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 0),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black26),
            color: Colors.lightGreen[50],
            borderRadius: BorderRadius.circular((10)),
          ),
          child: Text(
            num[index],
            style: const TextStyle(
              color: Colors.green,
              fontSize: 28.0,
              // height: 1.2,
              decorationStyle: TextDecorationStyle.dashed),
          ),
        )),
      );
    }

    var topWidget = Container(
      width: 1000,
      height: 150,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black26),
        color: const Color(0xfff8fefa),
        borderRadius: BorderRadius.circular((24)),
        boxShadow: const [
          BoxShadow(
              color: Color(0xECDAD8D8),
              offset: Offset(0.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 0.20),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green,
            // X_backgroundColor,
            Colors.lightGreen[200]!
          ]
        )
      ),
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      padding: const EdgeInsets.all(10),

      child: Column(
        children: [
          Expanded(flex: 1, child: roomNumWidget('4655386')),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text(
                    '剧本：《达摩克里斯之剑》',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      // height: 1.2,
                      decorationStyle: TextDecorationStyle.dashed
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  // alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: (){
                      Fluttertoast.showToast(
                        msg: "已复制到剪切板",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.lightGreen[300],
                        textColor: Colors.white,
                        fontSize: 12.0,
                      );
                    },
                    style: ButtonStyle(
                      // textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                      backgroundColor: MaterialStateProperty.all(Colors.green[400]),  //Colors.green[500]
                      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))//圆角弧度
                      ),
                      elevation: MaterialStateProperty.all(1.0)
                    ),
                    child: Icon(
                      Icons.copy,
                      color: Colors.grey[50],
                      size: 18,
                    )
                  )
                ),
              ]
            )
          )
        ],
      )
    );
    var mainBody = Container(
      child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          // padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            topWidget,
            RoomMemberList(),
            // RoomListWithFilter()
          ],
        ),
      // Column(
      //   // crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     // const Spacer(flex: 1,),
      //     Expanded(flex: 11, child: topWidget),
      //
      //     const Expanded(flex: 24, child: RoomMemberList()),
      //     // const Expanded(flex: 4, child: StartGameButton()),
      //   ],
      // ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("房间"),
          // backgroundColor: Colors.grey[100],
          // elevation: 0,
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Navigator.of(context).pop();
              },
            );
          }),
        ),
        floatingActionButton: StartGameButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: mainBody,
        backgroundColor: Colors.grey[100],
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
    List data = [
      {
        'name': '胡尔摩斯',
        'avatar': 'assets/avatars/avatar5.jpg',
      },
      {
        'name': '花生',
        'avatar': 'assets/avatars/avatar6.jpg',
      },
      {
        'name': '菠罗',
        'avatar': 'assets/avatars/avatar7.jpg',
      },
    ];
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        // itemExtent: 200,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return RoomMemberUnit(
            avatar: getImageFromPathOrUrl(data[index]['avatar']),
            name: data[index]['name'],
          );
        });
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
          // border: Border.all(color: Colors.black26),
          color: Colors.white,
          borderRadius: BorderRadius.circular((22)),
          boxShadow: const [
            BoxShadow(
                color: Color(0xECDAD8D8),
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                spreadRadius: 1.0),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20.0, left: 16, right: 16),
        // padding: const EdgeInsets.only(left: 0.0, bottom: 0),
        height: 160.0,
        child: Row(children: [
          // const Spacer(flex: 1,),
          Expanded(
              flex: 9,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular((16)),
                  image:
                      DecorationImage(image: widget.avatar, fit: BoxFit.fill),
                ),
              )),
          // const Spacer(flex: 1,),
          Expanded(
              flex: 15,
              child: Container(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Spacer(flex: 1,),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.name}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                    // const Spacer(flex: 1,),
                  ],
                ),
              ))
        ]));
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
    var button = Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        boxShadow: const [],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green[300]!,
            Colors.lightGreen,
            Colors.lightGreen[500]!,
          ]
        ),
        borderRadius: BorderRadius.circular((24)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          // textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          minimumSize: MaterialStateProperty.all(const Size(100, 40)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))//圆角弧度
          ),
          elevation: MaterialStateProperty.all(0)
        ),
        child: const Text('开始游戏'),
      ),
    );
    return Container(
      width: 1000,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: const BoxDecoration(

        color: Colors.transparent
      ),
      // color: Colors.transparent,
      child: button,
    );
  }
}
