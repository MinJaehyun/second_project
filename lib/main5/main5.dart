import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroducePage(),
    );
  }
}

class IntroducePage extends StatelessWidget {
  const IntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Tutorial',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 480,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Introduction Screen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            SizedBox(height: 10),
                            Text('1번째 스크린'),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Introduction Screen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            SizedBox(height: 10),
                            Text('2번째 스크린'),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Introduction Screen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            SizedBox(height: 10),
                            Text('3번째 스크린'),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Introduction Screen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            SizedBox(height: 10),
                            Text('4번째 스크린'),
                          ],
                        ),
                      ),
                    ],
                    controller: controller,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScrollingPageIndicator(
                      dotColor: Colors.grey,
                      dotSelectedColor: Colors.blue,
                      dotSize: 6,
                      dotSelectedSize: 10,
                      dotSpacing: 12,
                      controller: controller,
                      itemCount: 4,
                      orientation: Axis.horizontal,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 300,
            bottom: -10,
            child: ElevatedButton(
              onPressed: () {
                // todo: 클릭 시, 전체 user list 불러온다
              },
              child: Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
