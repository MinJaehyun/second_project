import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            '테스트 중 입니다',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}