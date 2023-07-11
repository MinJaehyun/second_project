import 'package:flutter/material.dart';
// import 'package:main7/1.share_scaffold/product_list1.dart';
import 'package:main7/2.appropriate_scaffold/product_list2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('상품 페이지 입니다'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductList();
                },
              ),
            );
          },
          child: Text('상품 페이지로 이동'),
        ),
      ),
    );
  }
}
