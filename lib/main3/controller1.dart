import 'package:get/get.dart';

class Controller1 extends GetxController {
  RxInt count = 1.obs;

  void increment() {
    count++;
  }
}
