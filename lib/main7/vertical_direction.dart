import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          verticalDirection: VerticalDirection.up, // defalut: VerticalDirection.down
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Text("test 1", style: TextStyle(fontSize: 22, color: Colors.white)),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blueAccent,
              child: Text("test 2", style: TextStyle(fontSize: 22, color: Colors.white)),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: Text("test 3", style: TextStyle(fontSize: 22, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
