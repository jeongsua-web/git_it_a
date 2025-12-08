import 'package:get/get.dart';

class DataLoadController extends GetxController {
  RxBool isDataLoad = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    // 2초 대기
    await Future.delayed(const Duration(seconds: 2));
    // 상태 변경
    isDataLoad.value = true;
  }
}
