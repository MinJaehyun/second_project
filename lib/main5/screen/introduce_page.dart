import 'package:flutter/material.dart';
import 'package:second_project/main5/screen/posts_page.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IntroducePage extends StatefulWidget {
  const IntroducePage({Key? key}) : super(key: key);

  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  int _currentPage = 0;

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
                // note: PageView.builder 내에 onPageChanged 를 활용하면 페이지가 변경될 때마다 index 값이 담겨 있다
                onPageChanged: (int index) {
                  setState(() => _currentPage = index);
                },
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 150),
                        Text('Introduction Screen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                        SizedBox(height: 10),
                        Text('${index + 1} 번째 스크린'),
                        SizedBox(height: 150),
                        Row(
                          children: [
                            SizedBox(width: 150),
                            DotsIndicator(
                              dotsCount: 3,
                              position: _currentPage,
                              decorator: DotsDecorator(
                                size: const Size.square(8.0),
                                activeSize: const Size(20.0, 8.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 70),
                            if (index == 2)
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => PostsPage()), (Route<dynamic> route) => false);
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
