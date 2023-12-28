import 'package:flutter/material.dart';
import 'package:second_project/main5/screen/introduce_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroducePage(),
    );
  }
}

