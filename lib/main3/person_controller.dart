import 'package:get/get.dart';

// person controller3
class PersonController3 extends GetxController {
  final person = Person().obs;

  void increment() {
    // note: 객체의 속성에 접근하여 변경하는 방법
    person.update((val) {
      val?.age++;
    });
  }
}

// Person model
class Person {
  Person({this.age = 10, this.name = ''});

  int age;
  String name;
}
