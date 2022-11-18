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
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HomePage", style: TextStyle(fontSize: 20, color: Colors.black),),
                ElevatedButton(
                    onPressed: (){Navigator.pushNamed(context, '/match');},
                    child: const Text("匹配"),
                )
              ],
            ),
        ),
      )
    );
  }
}
