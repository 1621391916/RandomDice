import 'package:flutter/material.dart';

class CreateScriptPage extends StatefulWidget {
  const CreateScriptPage({Key? key}) : super(key: key);

  @override
  State<CreateScriptPage> createState() => _CreateScriptPageState();
}

class _CreateScriptPageState extends State<CreateScriptPage> {
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      alignment: Alignment.center,
      // height: 300,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                color: Colors.white,
                borderRadius: BorderRadius.circular((0)),
              ),
              child: const TextField(
                // autofocus: true,
                decoration: InputDecoration(
                  // labelText: "输入标题，2-30字",
                  hintText: "输入标题，2-30字",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  // prefixIcon: Icon(Icons.person)
                ),
              ),
            )
          ),
          Expanded(
            flex: 50,
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black26),
                color: Colors.white,
                borderRadius: BorderRadius.circular((0)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  // labelText: "密码",
                  hintText: "剧本描述，1-40000字",
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(vertical: 100.0),
                  // prefixIcon: Icon(Icons.lock)
                ),
                // obscureText: true,
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                  onPressed: () { Navigator.of(context).pop(); },
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.green[500]),
                      minimumSize: MaterialStateProperty.all(const Size(200, 200)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))//圆角弧度
                      ),
                    ),
                    child: const Text('提交'),
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
      body: mainBody
    );
  }
}
