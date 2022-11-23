import 'package:flutter/material.dart';

class MyselfPage extends StatefulWidget {
  const MyselfPage({Key? key}) : super(key: key);

  @override
  _MyselfPageState createState() => _MyselfPageState();
}

class _MyselfPageState extends State<MyselfPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: const Text("MyselfPage", style: TextStyle(fontSize: 20, color: Colors.black),),
    );
  }
}
