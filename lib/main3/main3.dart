import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/main3/controller1.dart';
import 'package:second_project/main3/controller2.dart';
import 'package:second_project/main3/person_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  Controller1 controller1 = Get.put(Controller1());
  Controller2 controller2 = Get.put(Controller2());
  PersonController3 controller3 = Get.put(PersonController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Obx(
                // note: controller1.count.value , value 생략가능
                () => Text('test1: ${controller1.count}',
                    style: TextStyle(fontSize: 25)),
              ),
              ElevatedButton(
                onPressed: () {
                  controller1.increment();
                },
                child: Text('btn1'),
              ),
              Divider(thickness: 5),
              Obx(
                // note: controller1.count.value , value 생략가능
                () => Text(
                  'test2: ${controller2.count}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller2.increment();
                },
                child: Text('btn2'),
              ),
              Divider(thickness: 5),
              Obx(
                // note: controller1.count.value , value 생략 불가능
                () => Text('test3: ${controller3.person.value.age}',
                    style: TextStyle(fontSize: 25)),
              ),
              ElevatedButton(
                onPressed: () {
                  controller3.increment();
                },
                child: Text('btn3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
