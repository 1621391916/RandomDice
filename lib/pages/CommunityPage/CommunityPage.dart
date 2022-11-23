
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

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


  Widget DailyRec(){
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
          children:<Widget>[
            Text("一九七零年于海登堡(Heidelberg)举行的世界科幻大会中，奇幻战略游戏“善恶大决战”(Armageddon)展示，游戏的过程...")]

      )

    );


    // return ListView(
    //   // scrollDirection: Axis.horizontal,
    //   children: <Widget>[
    //     Text('data')
    //   ],
    // );


  }

  //用户信息区域
  Widget renderUserInfo() {

    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFCCCCCC),
                // backgroundImage: NetworkImage(data.userImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Priceless",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                ],
              ),
            ],
          ),
          Text(
            "11:28",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }

  //文字区域
  Widget renderTitle(){
    return Container(
      child:
        Row(
          children: <Widget>[
            Text("海登堡大战",style: TextStyle(
              fontSize: 15
            ),),
          Padding(padding: EdgeInsets.only(top: 30,left: 8,right: 8))
          ],
        )
    );
  }

  //发布图片区域
  Widget renderImage(){
    return Container(
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
              children: <Widget>[
                Image.asset("assets/images/1.jpg",fit: BoxFit.fitWidth,height: 80),
                Padding(padding: EdgeInsets.only(top: 100,bottom: 10,right: 50,left: 50)),],),



        ],
      ),
    );
  }

  // 内容区域
  Widget renderWord(){
    return Container(
        child:
        Column(
          children: <Widget>[
            Text("一九七零年于海登堡(Heidelberg)举行的世界科幻大会中，奇幻战略游戏“善恶大决战”(Armageddon)展示，游戏的过程...")
          ],
        )
    );
  }


  //互动区域
  Widget renderInteractionArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("恐怖·9809阅读",style: TextStyle(color: Colors.grey),),
              Padding(padding: EdgeInsets.only(left: 6,right: 20)),

            ],
          ),

          Row(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "1129",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFFFFC600),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "134",
                style: TextStyle(
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

  Widget UserInfo_1(){
    return Container(
        margin:EdgeInsets.all(16),
        alignment: Alignment.center,
        color: Colors.grey[100],
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this.renderUserInfo(),
              this.renderTitle(),
              this.renderImage(),
              this.renderWord(),
              this.renderInteractionArea(),]
        )
    );
  }


  Widget UserInfo_2(){
    return Container(
        margin:EdgeInsets.all(16),
        alignment: Alignment.center,
        color: Colors.grey[100],
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this.renderUserInfo(),
              this.renderTitle(),
              this.renderImage(),
              this.renderWord(),
              this.renderInteractionArea(),]
        )
    );
  }


  Widget UserInfo_3(){
    return Container(
      margin:EdgeInsets.all(16),
      alignment: Alignment.center,
      color: Colors.grey[100],
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this.renderUserInfo(),
            this.renderTitle(),
            this.renderImage(),
            this.renderWord(),
            this.renderInteractionArea(),]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        DefaultTabController(length: 7, child: Scaffold(
            appBar: AppBar(
              title: Text("剧本",style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              centerTitle: true,
              bottom: TabBar(
                isScrollable:true,
                labelColor: Colors.pink,
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
              )
            ),
            body: TabBarView(
              children: <Widget>[
                ListView(
                        children: [
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),

              ]
                        ),

                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),
                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),
                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),
                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),
                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),
                ListView(
                    children:[
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // this.DailyRec(),
                          this.UserInfo_1(),
                          this.UserInfo_2(),
                          this.UserInfo_3(),
                        ],)
                    ]
                ),


              ],
            ),
          )
          );
  }
}
