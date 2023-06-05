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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 가로 꽉 채움
            children: [
              Container(
                color: Colors.green,
                height: 150,
                child: Text('CrossAxisAlignment.baseline'),
              ),
              Container(
                color: Colors.yellow,
                height: 100,
                child: Row(
                  textBaseline: TextBaseline.alphabetic, // ideographic
                  // textBaseline: TextBaseline.ideographic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text('BaseLine', style: TextStyle(fontSize: 15)),
                    Text('BaseLine', style: TextStyle(fontSize: 55)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
