import 'package:flutter/material.dart';
import 'package:main6/screen/login_and_signup/login.dart';
import 'package:main6/screen/my_page.dart';
import 'package:main6/screen/user_info/nick_name_page.dart';
import 'package:main6/screen/login_and_signup/signup.dart';

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
        // note: primarySwatch: 앱의 일부 위젯, 버튼, 타이틀 바 등에서 orange 색이 자동으로 적용 (입력창 focuse 된 테두리 orange 로 변경함)
        primarySwatch: Colors.orange,
        // note: 앱 전체 abbBar 의 색상 지정
        appBarTheme: AppBarTheme(
          // icon 색
          iconTheme: IconThemeData(color: Colors.blue),
          // 배경색
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
