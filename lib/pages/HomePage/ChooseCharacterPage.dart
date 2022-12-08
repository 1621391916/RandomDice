import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';

class ChooseCharacterPage extends StatefulWidget {
  const ChooseCharacterPage({Key? key}) : super(key: key);

  @override
  State<ChooseCharacterPage> createState() => _ChooseCharacterPageState();
}

class _ChooseCharacterPageState extends State<ChooseCharacterPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: const <Widget>[
        TopButtonsWidget(),
        CharacterListWidget()
      ],
    );
    var scaffold = Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("选择角色"),
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

    return scaffold;
  }
}

class TopButtonsWidget extends StatelessWidget {
  const TopButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        // Expanded(flex: 10, child: CreateCharacterButton()),
        // Spacer(flex: 5,),
        Expanded(flex: 10, child: JoinRoomButton()),
      ],
    );
  }
}

class CreateCharacterButton extends StatelessWidget {
  const CreateCharacterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){Navigator.pushNamed(context, '/createCharacter');},
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.all(Colors.green[500]),
        minimumSize: MaterialStateProperty.all(const Size(50, 40)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
        ),
      ),
      child: const Text("创建角色"),
    );
  }
}

class JoinRoomButton extends StatelessWidget {
  const JoinRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button =  ElevatedButton(
      onPressed: (){Navigator.pushNamed(context, '/createRoom');},
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        minimumSize: MaterialStateProperty.all(const Size(50, 40)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))//圆角弧度
        ),
        elevation: MaterialStateProperty.all(0)
      ),
      child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text('前往房间', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      // const Text("前往房间"),
    );
    return Container(
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
      child: button,
    );
  }
}

class CharacterListWidget extends StatefulWidget {
  const CharacterListWidget({Key? key}) : super(key: key);

  @override
  State<CharacterListWidget> createState() => _CharacterListWidgetState();
}

class _CharacterListWidgetState extends State<CharacterListWidget> {
  late int choosedInx=-1;

  callback(newChoosedIdx){
    setState(() {
      choosedInx = (newChoosedIdx==choosedInx?-1:newChoosedIdx);
    });
  }
  cmpFunc(index){
    if (choosedInx<0){
      return false;
    }
    else{
      return choosedInx == index;
    }
  }

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        'name': '胡尔摩斯',
        'avatar': 'assets/avatars/avatar5.jpg',
        'description': '英格兰的顾问大侦探，苏格兰场的好朋友，头脑冷静、观察力敏锐、推理能力突出，善于通过观察与演绎推理和法学知识来解决问题'
      },
      {
        'name': '花生',
        'avatar': 'assets/avatars/avatar6.jpg',
        'description': '胡尔摩斯的助手，军医，热诚、聪明，脚踏实地，慷慨大方，时不时还会顽皮的幽默一下，同时还具备缄默少言的优点'
      },
      {
        'name': '菠罗',
        'avatar': 'assets/avatars/avatar7.jpg',
        'description': '比利时退休警官，然而常常被误认作法国人。是个有极度洁癖的小个子老头。做有时行为做作滑稽，要求条理、整洁。'
      },
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      // itemExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CharacterCardUnit(
          avatar: getImageFromPathOrUrl(data[index]['avatar']),
          name: data[index]['name'],
          description: data[index]['description'],
          index: index,
          pressed: cmpFunc(index),
          callback: callback,
        );
      }
    );
  }
}

class CharacterCardUnit extends StatefulWidget {

  dynamic avatar;
  String name, description;

  final int index;
  late bool pressed;
  Function(int) callback;

  CharacterCardUnit({
    Key? key,
    required this.avatar,
    required this.name,
    required this.description,
    
    required this.index,
    required this.pressed,
    required this.callback,
  }) : super(key: key);

  @override
  State<CharacterCardUnit> createState() => _CharacterCardUnitState();

}

class _CharacterCardUnitState extends State<CharacterCardUnit> {

  var BoxDecoration_unchoosed = BoxDecoration(
    // border: Border.all(color: Colors.black26),
    // border: Border.all(width: 0),
    color: Colors.white,
    borderRadius: BorderRadius.circular((18)),
    boxShadow: const [
      BoxShadow(
          color: Color(0xFFD5D5D5),
          offset: Offset(0.0, 4.0),
          blurRadius: 6.0, spreadRadius: 1.0
      ),
    ],
  );
  var BoxDecoration_choosed = BoxDecoration(
    // border: Border.all(color: Colors.orange),
    // border: Border.all(width: 0),
    color: Colors.lightGreen[200],
    borderRadius: BorderRadius.circular((18)),
    boxShadow: [
      BoxShadow(
          color: Colors.lightGreen[200]!,
          offset: Offset(0.0, 4.0),
          blurRadius: 6.0, spreadRadius: 1.0
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      decoration: BoxDecoration(
        // border: Border.all(width: 0),
        borderRadius: BoxDecoration_unchoosed.borderRadius,
        color: Colors.white,
      ),
      // color: Colors.white,
      child: Row(
        children: [
          // const Spacer(flex: 1,),
          Expanded(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular((16)),
                image: DecorationImage(
                  image: widget.avatar,
                  fit: BoxFit.fill
                ),
              ),
            )
          ),
          // const Spacer(flex: 1,),
          Expanded(
            flex: 15,
            child: Container(
              padding: EdgeInsets.only(left: 6, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Spacer(flex: 1,),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      alignment: Alignment.centerLeft,
                      child: Text('${widget.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    )
                  ),
                  const Spacer(flex: 1,),
                  Expanded(
                    flex: 12,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text('${widget.description}', style: TextStyle(fontSize: 14),),
                    )
                  ),
                  // const Spacer(flex: 1,),
                ],
              ),
            )
          ),
        ],
      ),
    );

    // 外面再嵌套一层实现选中时边框变色效果
    mainBody = Container(
      height: 160.0,
      margin: const EdgeInsets.only(top: 15.0, bottom: 20.0),
      padding: const EdgeInsets.all(5),
      decoration: widget.pressed ? BoxDecoration_choosed : BoxDecoration_unchoosed,
      child: mainBody
    );

    return GestureDetector(
      child: mainBody,
      onTap:(){
        setState(() {
          widget.callback(widget.index);
          // widget.pressed = !widget.pressed;
        });
      }
    );
  }
}

