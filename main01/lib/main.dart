import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main01/view/count.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Count(),
    );
  }
}

// GetX 사용하여 상태 관리만 한다면 MaterialApp를 적용해도 된다. 그 외 여러 기능 사용할 것이면 GetMaterialApp 적용 한다.
// GetX 로 상태 관리를 한다면 StatefulWidget 을 쓰지 않아도 됩니다.