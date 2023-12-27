import 'package:get/get.dart';

class CountController extends GetxController{
  final count = 0.obs;
  // int 제거해야 value 설정 가능
  // 방법 1. final count = 0.obs;
  // 방법 2. RxInt count = 0.obs;

  void countUp() {
    count.value++;
    // count(count.value + 1);
  }

  void countDown() {
    count.value--;
  }

  void countValue(int value) {
    count.value = value;
    // count(value);
  }
}

// note: 메서드 내 update() 실행하지 않으므로, 불필요한 랜더링을 하지 않는다
// note: GetBuilder 는 listen 못하므로, Getx or Obx 로 listen 하기
