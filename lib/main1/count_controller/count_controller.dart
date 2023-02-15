import 'package:get/get.dart';

class CountController extends GetxController{
  int count = 0;

  void countUp() {
    count++;
    update();
  }

  void countDown() {
    count--;
    update();
  }

  void countValue(int value) {
    count = value; // count(value) ?
    update();
  }
}