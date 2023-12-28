import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      home: Text('Flutter Demo Home Page2'),
      // theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.orange,
        // )
      // ),
    );
  }
}