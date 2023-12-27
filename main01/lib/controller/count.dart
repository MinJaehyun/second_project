import 'package:get/get.dart';
import 'package:main01/model/count.dart';

class CountController extends GetxController{
  // 방법 1. final count = 0.obs;
  // 방법 2. RxInt count = 0.obs;
  final _count = Count().obs;
  Rx<Count> get count => _count;

  void countUp() {
    _count.update((val) {
      val?.count++;
    });
    // 위와 결과 값이 같다: count(count.value + 1);
  }

  void countDown() {
    _count.update((val) {
      val?.count--;
    });
  }

  void countValue(int value) {
    _count.update((val) {
      _count(value as Count?);
    });
  }
}

// note: 메서드 내 update() 실행하지 않으므로, 불필요한 랜더링 하지 않는다
// note: GetBuilder 는 listen 못하므로, Getx or Obx 로 listen 하기