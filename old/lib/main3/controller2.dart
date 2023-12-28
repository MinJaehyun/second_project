import 'package:get/get.dart';

class Controller2 extends GetxController {
  final count = 5.obs;

  void increment() {
    count.value++;
    // count(count.value + 1);
  }
}
