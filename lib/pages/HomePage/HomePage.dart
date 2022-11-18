import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    print('------main, ----build');
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text("HomePage", style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
}
