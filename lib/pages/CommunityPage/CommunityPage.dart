import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  @override
  Widget build(BuildContext context) {
    print('------main, ----build');
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text("CommunityPage", style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
}
