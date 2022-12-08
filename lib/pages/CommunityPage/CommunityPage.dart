import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_dice_game/utils.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // List<DropdownMenuItem<String>> sortItems = [];
  // String _selectedSort = '排序';
  // sortItems.add(DropdownMenuItem(value: '排序', child: Text('排序')));
  // sortItems.add(DropdownMenuItem(value: '价格降序', child: Text('价格降序')));
  // sortItems.add(DropdownMenuItem(value: '价格升序', child: Text('价格升序')));

  // //下拉菜单
  // Widget Sort(){
  //   return Scaffold(
  //     body: Center(
  //       child: DropdownButton<String>(
  //         value: dropdownValue,
  //         onChanged: (String newValue) {
  //           setState(() {
  //             dropdownValue = newValue;
  //           });
  //         },
  //         items: <String>['One', 'Two', 'Free', 'Four']
  //             .map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value),
  //           );
  //         })
  //             .toList(),
  //       ),
  //     ),
  //   );
  // }

  Widget DailyRec() {
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: <Widget>[
    //     Container(
    //       width: 20,
    //       color: Colors.black,
    //     ),
    //     Container(
    //       width: 20,
    //       color: Colors.pink,
    //     ),
    //     Container(
    //       width: 20,
    //       color: Colors.blue,
    //     )
    //   ],
    // );
    return Expanded(
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
          Text(
              "一九七零年于海登堡(Heidelberg)举行的世界科幻大会中，奇幻战略游戏“善恶大决战”(Armageddon)展示，游戏的过程...")
        ]));

    // return ListView(
    //   // scrollDirection: Axis.horizontal,
    //   children: <Widget>[
    //     Text('data')
    //   ],
    // );
  }

  //用户信息区域
  Widget renderUserInfo(String avatar, String nickName, String postDate) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                // child: Image(image: getImageFromPathOrUrl("assets/avatars/avatar3.jpg")),
                backgroundImage: getImageFromPathOrUrl(avatar),
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nickName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 2)),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, right: 4),
            child: Text(
              postDate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF999999),
              ),
            ),
          )
        ],
      ),
    );
  }

  //文字区域
  Widget renderTitle(title) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  //发布图片区域
  Widget renderImage(contentImage) {
    return Container(
      // margin: const EdgeInsets.only(left: 20),
      height: 140,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            // [Image.asset("assets/images/2.jpg",fit: BoxFit.fitWidth,height: 80),
            //         Padding(padding: EdgeInsets.only(top: 100,bottom: 10,right: 50,left: 50)),],
            List.generate(
                min(contentImage.length, 3),
                (index) => Container(
                      width: 100,
                      margin: EdgeInsets.only(right: 10, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((10)),
                          image: DecorationImage(
                              image:
                                  getImageFromPathOrUrl(contentImage[index]),
                              fit: BoxFit.fill),
                          color: Colors.green
                      ),
                      // color: Colors.green,
                    ))),
    );
  }

  // 内容区域
  Widget renderWord(contentText) {
    return Container(
        // padding: const EdgeInsets.only(left: 10),
        child: Column(
      children: <Widget>[Text(contentText)],
    ));
  }

  //互动区域
  Widget renderInteractionArea(type, numReader, numComment, numLike) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "$type·$numReader阅读",
                style: const TextStyle(color: Colors.grey),
              ),
              const Padding(padding: EdgeInsets.only(left: 6, right: 20)),
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.message,
                size: 16,
                color: Color(0xFF999999),
              ),
              const Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "$numComment",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFFFFC600),
              ),
              const Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "$numLike",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget commentUnit(data) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black26),
          color: const Color(0xfff8fefa),
          borderRadius: BorderRadius.circular((22)),
          boxShadow: const [
            BoxShadow(
                color: Color(0xECDAD8D8),
                offset: Offset(2.0, 2.0),
                blurRadius: 6.0,
                spreadRadius: 1.0),
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              renderUserInfo(
                  data['avatar'], data['nickName'], data['postDate']),
              renderTitle(data['title']),
              renderImage(data['contentImage']),
              renderWord(data['contentText']),
              renderInteractionArea(data['type'], data['numReader'],
                  data['numComment'], data['numLike']),
            ]));
  }

  Widget singlePage() {
    List data = [
      {
        'avatar': "assets/avatars/avatar4.jpg",
        'nickName': 'Random',
        'postDate': '13:01',
        'title': '《国土》评测',
        'contentImage': ["assets/images/0-0.jpg", "assets/images/0-1.jpg", "assets/images/0-2.jpg"],
        'contentText':
            "《国士》是一部关于家国题材的机制阵营本，背景时间是春秋战国时期，群雄并起、诸侯争纷不断，楚王下令只要能破丹阳之困就与他平分郡守之位，到底谁能脱颖而出，力挽狂澜呢？...",
        'type': '历史',
        'numReader': 10006,
        'numComment': 967,
        'numLike': 150
      },
      {
        'avatar': "assets/avatars/avatar8.jpg",
        'nickName': 'Priceless',
        'postDate': '20:39',
        'title': '《我却 乌云遮目》：善恶仅在一念之间',
        'contentImage': ["assets/images/2-0.jpg"],
        'contentText': "关于人性本善还是人性本恶的问题，早在两千多年前就有人探讨过。然而这个问题直到如今，也没讨论出结果。...",
        'type': '恐怖',
        'numReader': 8646,
        'numComment': 664,
        'numLike': 78
      },
      {
        'avatar': "assets/avatars/avatar3.jpg",
        'nickName': 'Priceless',
        'postDate': '11:28',
        'title': '《孙策》',
        'contentImage': ["assets/images/1-0.jpg"],
        'contentText':
            "《孙策》是一个古风历史沉浸情感题材的剧本，选题于大家熟知的三国题材，整个剧本需要7名玩家参与到其中大概6个小时左右，比较适合喜欢三国题材的玩家，里面有很多演绎的场景，水龙头玩家也非常适合。...",
        'type': '历史',
        'numReader': 9809,
        'numComment': 1129,
        'numLike': 134
      },
    ];
    return ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
        shrinkWrap: true,
        itemCount: data.length,
        // itemExtent: 200,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return commentUnit(data[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    var mainBody =
        TabBarView(children: List<Widget>.generate(7, (index) => singlePage()));
    return DefaultTabController(
        length: 7,
        child: Scaffold(
            appBar: AppBar(
                title: const Text(
                  "剧本",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: X_backgroundColor,
                centerTitle: true,
                elevation: 0,
                bottom: const TabBar(
                  isScrollable: true,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: "推荐"),
                    Tab(text: "硬核"),
                    Tab(text: "悬疑"),
                    Tab(text: "推理"),
                    Tab(text: "恐怖"),
                    Tab(text: "情感"),
                    Tab(text: "欢乐"),
                  ],
                )),
            backgroundColor: X_backgroundColor,
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [X_backgroundColor, const Color(0xFFF1F8E9)])),
                child: mainBody)));
  }
}
