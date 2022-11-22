import 'package:flutter/material.dart';


class MatchButton extends StatelessWidget {
  const MatchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){Navigator.pushNamed(context, '/match');},
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30)),
        backgroundColor: MaterialStateProperty.all(Colors.green[500]),
        minimumSize: MaterialStateProperty.all(const Size(100, 200)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
        ),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children:const [
          Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("匹配")),
          Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Icon(
              Icons.search_rounded,
              color: Colors.blue,
              size: 40.0,
            ),
          )
        ]
      )
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen[400]),
        minimumSize: MaterialStateProperty.all(const Size(100, 100)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))//圆角弧度
        ),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children:const [
          Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("创建房间")),
          Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Icon(
              Icons.search_rounded,
              color: Colors.blue,
              size: 40.0,
            ),
          )
        ]
      )
    );
  }
}

class CreateScriptButton extends StatelessWidget {
  const CreateScriptButton({Key? key}) : super(key: key);
  // 创建剧本按钮

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen[600]),
        minimumSize: MaterialStateProperty.all(const Size(100, 100)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))//圆角弧度
        ),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children:const [
          Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("创建剧本")),
          Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Icon(
              Icons.search_rounded,
              color: Colors.blue,
              size: 40.0,
            ),
          )
        ]
      )
    );
  }
}
