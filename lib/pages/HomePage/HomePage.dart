import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: X_backgroundColor,//Colors.transparent,
        elevation: 0,
      ),
      // backgroundColor: Color(0xfff8fefa), //Colors.black,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              X_backgroundColor,
              const Color(0xFFF1F8E9)
            ]
          )
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          // padding: const EdgeInsets.all(16.0),
          children: const <Widget>[
            RecommendSlidWidget(),
            TopButtonsWidget(),
            RoomFilterWidget(),
            RoomListWidget(),
            // RoomListWithFilter()
          ],
        ),
      )


    );
  }
}


class TopButtonsWidget extends StatelessWidget {
  const TopButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8, right: 8),
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16, right: 16),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: 150.0,
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              // padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              children: const [
                Expanded(flex: 5, child: CreateRoomButton()),
                Spacer(flex: 1,),
                Expanded(flex: 5, child: CreateScriptButton()),
              ],
            )
          ),
          const Spacer(
            flex: 1,
          ),
          const Expanded(
            flex: 10,
            child: MatchButton(),
          ),
        ],
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
        backgroundColor: MaterialStateProperty.all(const Color(0xff00ad19)),  //Colors.green[500]
        minimumSize: MaterialStateProperty.all(const Size(100, 200)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))//圆角弧度
        ),
        elevation: MaterialStateProperty.all(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("搜索房间", style: TextStyle(fontSize: 20),)),
          // Spacer(flex: 1,),
          Expanded(
            flex: 5,
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey[300],
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
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen), //Colors.lightGreen[400]
        minimumSize: MaterialStateProperty.all(const Size(100, 100)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))//圆角弧度
        ),
        elevation: MaterialStateProperty.all(6.0)
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children:  [
          Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("创建房间")),
          Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Icon(
              Icons.other_houses,
              color: Colors.grey[300],
              size: 30.0,
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
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
        minimumSize: MaterialStateProperty.all(const Size(100, 100)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))//圆角弧度
        ),
        elevation: MaterialStateProperty.all(4.0)
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children: [
          Spacer(flex: 1,),
          Expanded(flex: 10, child: Text("创建剧本")),
          Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Icon(
              Icons.book,
              color: Colors.grey[300],
              size: 30.0,
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
    List bannerData = [
      {
        'name': '《达摩克利斯之剑》',
        'score': 8.8,
        'cover': "assets/covers/cover1.png",
        'tags': const ['未来', '推理', '硬核'],
      },
      {
        'name': '《怪闻夜行惊奇卷》',
        'score': 8.0,
        'cover': "assets/covers/cover2.png",
        'tags': const ['古风', '惊悚', '还原', '硬核'],
      }
    ];
    return Container(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 4, right: 4),
      margin: const EdgeInsets.only(bottom: 10.0, left: 8, right: 8),
      // width: 300,
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return RecommendUnit(
              name: bannerData[index]['name'],
              score: bannerData[index]['score'],
              cover: getImageFromPathOrUrl(bannerData[index]['cover']),
              tags: bannerData[index]['tags'],
          );
        },
        itemCount: bannerData.length,
        scale: 1,
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(0),
          builder: DotSwiperPaginationBuilder(color: Colors.grey[300], activeColor: Colors.green[200])
        ),
        // control: const SwiperControl(),
        autoplay: true,
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

  final String name;
  final num score;
  final List tags;
  dynamic cover;

  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black26),
        color: const Color(0xfff8fefa),
        borderRadius: BorderRadius.circular((20)),
        boxShadow: const [
          BoxShadow(
              color: Color(0xECDAD8D8),
              offset: Offset(0.0, 4.0),
              blurRadius: 6.0, spreadRadius: 1.0
          ),
        ],
      ),
      // width: 300,
      // height: 300,
      margin: const EdgeInsets.all(6.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((16)),
                  image: DecorationImage(
                    image: cover,
                    fit: BoxFit.fill
                  ),
                ),
              )
            ),
            // const Spacer(flex: 1,),
            Expanded(
              flex: 20,
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    // 标题和评分
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(flex: 7, child: Text(
                              name,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            )),
                            const Spacer(flex: 1,),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  score.toString(),
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(fontSize: 16.0, color: Colors.red,),
                                ),
                              )
                            ),
                          ],
                        ),
                      )
                    ),
                    // 标签
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(tags.length, (i) =>
                            Container(
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black26),
                                color: Color(0xffe7f4ea),
                                borderRadius: BorderRadius.circular((10)),
                              ),
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
                              child: Text(
                                tags[i],
                                style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                                // textAlign: TextAlign.start,
                              ),
                            )
                          ),
                        ),
                      )
                    ),
                    // 即刻加入
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4, top: 0),
                        child: Row(
                          children: [
                            const Spacer(flex: 3,),
                            Expanded(
                              flex: 3,
                              child: Container(
                                // alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 10, bottom: 0),
                                padding: const EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black26),
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular((10)),
                                ),
                                // color: Colors.lightGreen,
                                child: Row(
                                  children: const [
                                    Expanded(
                                      flex: 5,
                                      child: Text('即刻加入', style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: Colors.lightGreenAccent,
                                        size: 24,
                                      )
                                    )
                                  ],
                                )
                              )
                            )
                          ],
                        ),
                      )
                    ),
                  ],
                )
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
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: mainBody,
      )
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
    Color? dropDownButtonColor=Colors.lightGreen[50];
    Color? dropDownItemColor=Colors.white;
    return Container(
      height: 90.0,
      padding: const EdgeInsets.only(left: 12, right: 12),
      margin: const EdgeInsets.only(bottom: 16),

      child: Column(
        // direction: Axis.vertical,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Row(children: const [Text('房间', style: TextStyle(fontSize: 22))],),
            )
          ),
          // const Spacer(flex: 1,),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
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
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // border: Border.all(
                          //   color: Colors.black26,
                          // ),
                          color: dropDownButtonColor,
                        ),
                        // buttonElevation: 1,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: dropDownItemColor,
                        ),
                      ),
                    )
                  ),
                  const Spacer(flex: 1,),
                  Expanded(
                    flex: 20,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
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
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // border: Border.all(
                          //   color: Colors.black26,
                          // ),
                          color: dropDownButtonColor,
                        ),
                        // buttonElevation: 1,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: dropDownItemColor,
                        ),
                        // buttonHeight: 20,
                      ),
                    )
                  ),
                  const Spacer(flex: 1,),
                  Expanded(
                    flex: 20,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
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
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // border: Border.all(
                          //   color: Colors.black26,
                          // ),
                          color: dropDownButtonColor,
                        ),
                        // buttonElevation: 1,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: dropDownItemColor,
                        ),
                      ),
                    )
                  ),
                  // const Spacer(flex: 2,),
                ],
              )
            )

          )
          // Expanded(
          //   flex: 10,
          //   child: child
          // )
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
    List<Map> roomData = [
      {
        'name': '怪闻夜行惊奇卷',
        'score': 9.6,
        'cover': 'assets/covers/cover2.png',
        'KP': '张三',
        'tags': const ['古风', '惊悚', '还原', '硬核'],
        'difficulty': 3,
        'roomCapacity': 5,
        'roomPeopleNum': 4
      },
      {
        'name': '月亮沉入海底时',
        'score': 8.0,
        'cover': 'assets/covers/cover3.png',
        'KP': '李四',
        'tags': const ['现代', '情感', '还原', '新手'],
        'difficulty': 2,
        'roomCapacity': 6,
        'roomPeopleNum': 4
      },
      {
        'name': '苍岐',
        'score': 6.8,
        'cover': 'assets/covers/cover4.png',
        'KP': '王五',
        'tags': const ['古风', '情感', '还原', '进阶'],
        'difficulty': 3,
        'roomCapacity': 5,
        'roomPeopleNum': 1
      },
    ];
    return ListView.builder(
      padding: EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      itemCount: 3,
      // itemExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return RoomUnit(
          name: roomData[index]['name'],
          score: roomData[index]['score'],
          cover: getImageFromPathOrUrl(roomData[index]['cover']),
          KP: roomData[index]['KP'],
          tags: roomData[index]['tags'],
          difficulty: roomData[index]['difficulty'],
          roomCapacity: roomData[index]['roomCapacity'],
          roomPeopleNum: roomData[index]['roomPeopleNum']
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
  final num score;
  final List tags;
  dynamic cover;
  @override
  Widget build(BuildContext context) {
    var mainBody = Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black26),
        color: const Color(0xfff8fefa),
        borderRadius: BorderRadius.circular((24)),
        boxShadow: const [
          BoxShadow(
              color: Color(0xECDAD8D8),
              offset: Offset(0.0, 4.0),
              blurRadius: 15.0, spreadRadius: 0.20
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 230.0,
      child: Column(
        children: [
          Container(
            height: 30,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                // const Spacer(flex: 1,),
                Expanded(
                  flex: 6,
                  child: Text(
                    '《$name》',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  )
                ),
                // const Spacer(flex: 4,),
                // Expanded(
                //   flex: 4,
                //   child: Text('评分： ${score.toString()}')
                // ),
                RatingStars(
                  rating: score.toDouble()/2,
                  editable: false,
                  color: Colors.orange,
                  iconSize: 24,
                )
              ],
            )
          ),
          // const Spacer(flex: 1,),
          Expanded(
            // flex: 50,
            child: Row(
              children: [
                // const Spacer(flex: 1,),
                Expanded(
                  flex: 8,
                  child: Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((16)),
                      image: DecorationImage(
                        image: cover,
                        fit: BoxFit.fill
                      ),
                    ),
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
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('KP：$KP',),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('类型：${tags.join(' ')}', ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('难度：${['低', '中', '高'][difficulty-1]}'),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('房间人数：$roomPeopleNum/$roomCapacity'),
                        )
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

class RoomListWithFilter extends StatefulWidget {
  const RoomListWithFilter({Key? key}) : super(key: key);

  @override
  State<RoomListWithFilter> createState() => _RoomListWithFilterState();
}

class _RoomListWithFilterState extends State<RoomListWithFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
        color: Colors.black87
      ),
      child: Column(
        children: const [
          RoomFilterWidget(),
          RoomListWidget()
        ],
      ),
    );
  }
}
