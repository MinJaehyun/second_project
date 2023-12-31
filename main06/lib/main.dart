import 'package:flutter/material.dart';
import 'package:main06/login_and_signup/login.dart';
import 'package:main06/login_and_signup/signup.dart';
import 'package:main06/success_login/my_page.dart';
import 'package:main06/user_info/nickname.dart';

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
        // note: Material2의 primarySwatch 대신 Material3의 colorScheme 적용
        // primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        // note: 앱 전체 abbBar 의 색상 지정
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          color: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => Login(),
        '/signup': (_) => Signup(),
        '/my_page': (_) => MyPage(),
        '/nick_name_page': (_) => NickNamePage(),
      },
    );
  }
}