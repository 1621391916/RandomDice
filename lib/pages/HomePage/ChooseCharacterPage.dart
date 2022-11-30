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
        title: Text("我的角色"),
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
        Expanded(flex: 10, child: CreateCharacterButton()),
        Spacer(flex: 5,),
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
    return ElevatedButton(
      onPressed: (){Navigator.pushNamed(context, '/createRoom');},
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.all(Colors.orange),
        minimumSize: MaterialStateProperty.all(const Size(50, 40)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
        ),
      ),
      child: const Text("前往房间"),
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      // itemExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CharacterCardUnit(
          avatar: getImageFromPathOrUrl('assets/avatars/avatar1.png'),
          name: '角色${index+1}',
          description: '角色描述...',
          
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
    color: Colors.white,
    borderRadius: BorderRadius.circular((10)),
    boxShadow: const [
      BoxShadow(
          color: Color(0xFFD5D5D5),
          offset: Offset(2.0, 2.0),
          blurRadius: 6.0, spreadRadius: 1.0
      ),
    ],
  );
  var BoxDecoration_choosed = BoxDecoration(
    border: Border.all(color: Colors.orange),
    color: Colors.orange,
    borderRadius: BorderRadius.circular((10)),
    boxShadow: const [
      BoxShadow(
          color: Color(0xFFD5D5D5),
          offset: Offset(2.0, 2.0),
          blurRadius: 6.0, spreadRadius: 1.0
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      color: Colors.white,
      child: Row(
        children: [
          const Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Image(
              image: widget.avatar,
              width: 150,
              height: 130,
              fit: BoxFit.fill,
            )
          ),
          const Spacer(flex: 1,),
          Expanded(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1,),
                Expanded(
                  flex: 1,
                  child: Text('姓名：${widget.name}')
                ),
                const Spacer(flex: 1,),
                Expanded(
                  flex: 1,
                  child: Text('描述：${widget.description}')
                ),
              ],
            )
          ),
        ],
      ),
    );

    // 外面再嵌套一层实现选中时边框变色效果
    mainBody = Container(
      height: 150.0,
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
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

