import 'package:flutter/material.dart';
import 'posts_page.dart';

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
      body: SizedBox(
        height: 480,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 150),
                        Text('Introduction Screen',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        SizedBox(height: 10),
                        Text('${index + 1} 번째 스크린'),
                        SizedBox(height: 150),
                        Row(
                          children: [
                            SizedBox(width: 180),
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
                            SizedBox(width: 70),
                            if (index == 3)
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => PostsPage()),
                                          (Route<dynamic> route) => false);
                                },
                                child: Text('Done'),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
