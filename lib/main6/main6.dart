import 'package:flutter/material.dart';
import 'package:second_project/main6/view/nick_name_page.dart';
import 'package:second_project/main6/view/signin_page.dart';
import 'package:second_project/main6/view/signup_page.dart';
import 'package:second_project/main6/view/my_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 입력창에 focuse 된 테두리 orange 로 변경된다
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninPage(),
        '/signup': (context) => SignupPage(),
        '/my_page': (context) => MyPage(),
        '/nick_name_page': (context) => NickNamePage(),
      },
    );
  }
}
