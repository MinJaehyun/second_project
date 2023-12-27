import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main01/controller/count.dart';

class Count extends StatelessWidget {
  Count({Key? key}) : super(key: key);
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // note: Reactive state mangement: 즉시 업데이트 기능을 한다
              Obx(() {
                return Text(countController.count.toString(),
                    style: const TextStyle(fontSize: 36));
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      countController.countDown();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: const Size(100, 50)),
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      countController.countUp();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: const Size(100, 50)),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  countController.countValue(5);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(100, 50)),
                child: const Text('5로 변경하기', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}