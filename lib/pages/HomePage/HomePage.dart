import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          TopButtonsWidget(),
          RecommendSlidWidget(),
          RoomFilterWidget(),
          RoomListWidget(),
        ],
      ),

    );
  }
}


class TopButtonsWidget extends StatelessWidget {
  const TopButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 0.0),
      child: SizedBox(
        height: 150.0,
        //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            const Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: MatchButton(),
              )
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(flex: 5, child: CreateRoomButton()),
                    Spacer(flex: 1,),
                    Expanded(flex: 5, child: CreateScriptButton()),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class MatchButton extends StatelessWidget {
  const MatchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){Navigator.pushNamed(context, '/joinRoom');},
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
      onPressed: (){Navigator.pushNamed(context, '/createRoom');},
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
      onPressed: (){Navigator.pushNamed(context, '/createScript');},
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


class RecommendSlidWidget extends StatefulWidget {
  const RecommendSlidWidget({Key? key}) : super(key: key);

  @override
  State<RecommendSlidWidget> createState() => _RecommendSlidWidgetState();
}

class _RecommendSlidWidgetState extends State<RecommendSlidWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
      child: SizedBox(
        height: 170.0,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(flex: 5, child: Row(children: const [Text('精选', style: TextStyle(fontSize: 22))],)),
            const Spacer(flex: 1,),
            Expanded(
              flex: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  RecommendUnit(
                    name: '《青楼》',
                    score: 8.8,
                    // coverUrl: 'https://s1.ax1x.com/2022/11/21/zlUGP1.png',
                    cover: getImageFromPathOrUrl("assets/covers/cover1.png"),
                    tags: const ['123', '456'],
                  ),
                  RecommendUnit(
                    name: '《青楼》',
                    score: 8.8,
                    // coverUrl: 'https://s1.ax1x.com/2022/11/21/zlUGP1.png',
                    cover: getImageFromPathOrUrl("assets/covers/cover2.png"),
                    tags: const ['123', '456'],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class RecommendUnit extends StatelessWidget {
  RecommendUnit({
    Key? key,
    required this.name,
    // required this.coverUrl,
    required this.cover,
    required this.score,
    required this.tags,
  }) : super(key: key);

  final String name;//, coverUrl;
  final double score;
  final List tags;
  dynamic cover;

  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular((10)),
        boxShadow: const [
          BoxShadow(
              color: Color(0xECDAD8D8),
              offset: Offset(2.0, 2.0),
              blurRadius: 6.0, spreadRadius: 1.0
          ),
        ],
      ),
      width: 300,
      height: 200,
      margin: const EdgeInsets.all(6.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 15,
              child: Image(
                image: cover,//NetworkImage(coverUrl),
                // width: 80,
              )
            ),
            const Spacer(flex: 1,),
            Expanded(
              flex: 20,
              child: Column(
                children: [
                  // 标题和评分
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(flex: 4, child: Text(
                          name,
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        )),
                        const Spacer(flex: 1,),
                        Expanded(flex: 2, child: Text(
                          score.toString(),
                          style: const TextStyle(color: Colors.red,),
                        )),

                      ],
                    )
                  ),
                  // 标签
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(tags.length, (i) =>
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular((10)),
                          ),
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Text(tags[i], style: const TextStyle(fontSize: 12.0,),),
                        )
                      ),
                    )
                  ),
                  // 即刻加入
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text('即刻加入'),
                    )
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chooseCharacter');
      },
      child: mainBody,
    );
  }
}


class RoomFilterWidget extends StatefulWidget {
  const RoomFilterWidget({Key? key}) : super(key: key);

  @override
  State<RoomFilterWidget> createState() => _RoomFilterWidgetState();
}


class _RoomFilterWidgetState extends State<RoomFilterWidget> {
  int? sortTypeValue;
  int? scriptTypeValue;
  int? difficultyTypeValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      padding: const EdgeInsets.only(left: 10),

      child: Column(
        // direction: Axis.vertical,
        children: [
          Expanded(flex: 15, child: Row(children: const [Text('房间', style: TextStyle(fontSize: 22))],)),
          // const Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: DropdownButton(
                    value: sortTypeValue,
                    hint: const Text('排序方式'),
                    onChanged: (newValue) {
                      setState(() {
                        sortTypeValue = newValue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(value:1, child: Text('剧本评分')),
                      DropdownMenuItem(value:2, child: Text('KP评分')),
                    ],
                  ),
                ),
                const Spacer(flex: 2,),
                Expanded(
                  flex: 10,
                  child: DropdownButton(
                    value: scriptTypeValue,
                    hint: const Text('类型'),
                    onChanged: (newValue) {
                      setState(() {
                        scriptTypeValue = newValue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(value:1, child: Text('不限')),
                      DropdownMenuItem(value:2, child: Text('情感本')),
                      DropdownMenuItem(value:3, child: Text('搞笑本')),
                      DropdownMenuItem(value:4, child: Text('恐怖本')),
                    ],
                  ),
                ),
                const Spacer(flex: 2,),
                Expanded(
                  flex: 10,
                  child: DropdownButton(
                    hint: const Text('难度'),
                    value: difficultyTypeValue,
                    onChanged: (newValue) {
                      setState(() {
                        difficultyTypeValue = newValue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(value:1, child: Text('高')),
                      DropdownMenuItem(value:2, child: Text('中')),
                      DropdownMenuItem(value:3, child: Text('低')),
                    ],
                  ),
                ),
                const Spacer(flex: 6,),
              ],
            )
          )
        ],
      ),
    );
  }
}



class RoomListWidget extends StatefulWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  State<RoomListWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<RoomListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      // itemExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return RoomUnit(
          name: '红黑馆事件',
          score: 8,
          cover: getImageFromPathOrUrl('assets/covers/cover2.png'),
          KP: '张三',
          tags: const ['悬疑', '推理', '硬核', '现代'],
          difficulty: 3,
          roomCapacity: 5,
          roomPeopleNum: 1
        );
      }
    );
  }
}

class RoomUnit extends StatelessWidget {
  RoomUnit({
    Key? key,
    required this.name,
    required this.score,
    required this.cover,
    required this.KP,
    required this.tags,
    required this.difficulty,
    required this.roomCapacity,
    required this.roomPeopleNum,
  }) : super(key: key);

  final String name, KP;
  final int roomCapacity, roomPeopleNum;
  final int difficulty;
  final double score;
  final List tags;
  dynamic cover;
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular((10)),
        boxShadow: const [
          BoxShadow(
              color: Color(0xECDAD8D8),
              offset: Offset(2.0, 2.0),
              blurRadius: 6.0, spreadRadius: 1.0
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.only(left: 0.0, bottom: 12),
      height: 200.0,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Spacer(flex: 1,),
                Expanded(flex: 6, child: Text('《$name》', style: TextStyle(fontWeight: FontWeight.bold),)),
                const Spacer(flex: 4,),
                Expanded(flex: 4, child: Text('评分： ${score.toString()}')),
              ],
            )
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                const Spacer(flex: 1,),
                Expanded(
                  flex: 8,
                  child: Image(
                    image: cover,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  )
                ),
                const Spacer(flex: 1,),
                Expanded(
                  flex: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('KP：$KP')
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('类型：${tags.join(' ')}')
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('难度：${['低', '中', '高'][difficulty-1]}')
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('房间人数：$roomPeopleNum/$roomCapacity')
                      ),
                    ],
                  )
                )
              ],
            )
          )
        ],
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chooseCharacter');
      },
      child: mainBody,
    );
  }
}
