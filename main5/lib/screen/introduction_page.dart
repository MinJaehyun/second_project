import 'package:flutter/material.dart';
import 'package:main5/screen/users.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 25);
    List<PageViewModel> listPagesViewModel = [
      for (int i = 0; i < 4; i++)
        PageViewModel(
          titleWidget: Container(
            child: Column(
              children: [SizedBox(height: 150), Text('Introduction Screen', style: style)],
            ),
          ),
          bodyWidget: Text('${i + 1} 번째 스크린', style: style),
        ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        skip: const Text("Skip"),
        showSkipButton: true,
        next: const Text("Next"),
        showNextButton: true,
        done: const Text("Done"),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Users(),
            ),
          );
        },
      ),
    );
  }
}
