import 'package:flutter/material.dart';
import './Buttons.dart';

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
        padding: const EdgeInsets.all(20.0),
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
            Expanded(flex: 5, child: Row(children: const [Text('精选')],)),
            const Spacer(flex: 1,),
            Expanded(
              flex: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  RecommendUnit(
                    name: '《青楼》',
                    score: 8.8,
                    coverUrl: 'https://s1.ax1x.com/2022/11/21/zlUGP1.png',
                    tags: ['123', '456'],
                  ),
                  RecommendUnit(
                    name: '《青楼》',
                    score: 8.8,
                    coverUrl: 'https://s1.ax1x.com/2022/11/21/zlUGP1.png',
                    tags: ['123', '456'],
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
  const RecommendUnit({
    Key? key,
    required this.name,
    required this.coverUrl,
    required this.score,
    required this.tags,
  }) : super(key: key);

  final String name, coverUrl;
  final double score;
  final List tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular((10)),
      ),
      width: 300,
      height: 200,
      margin: const EdgeInsets.only(right: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 10,
              child: Image(
                image: NetworkImage(coverUrl),
                width: 100,
              )
            ),
            const Spacer(flex: 1,),
            Expanded(
              flex: 10,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  // 标题和评分
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(name),
                        Text(score.toString())
                      ],
                    )
                  ),
                  // 标签
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(tags.length, (i) => Text(tags[i])),
                    )
                  ),
                  // 即刻加入
                  const Expanded(
                    flex: 1,
                    child: Text('即刻加入')
                  ),
                ],
              )
            )
          ],
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
      child: SizedBox(
        height: 70.0,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(flex: 10, child: Row(children: const [Text('房间')],)),
            // const Spacer(flex: 1,),
            Expanded(
              flex: 20,
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
    return Container(
      height: 800,
      color: Colors.red
    );
  }
}

