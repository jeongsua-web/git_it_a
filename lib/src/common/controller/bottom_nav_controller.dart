import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  
  // 현재 선택된 메뉴 인덱스
  RxInt menuIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // 4개 탭을 위한 TabController 초기화
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // 메뉴 변경 함수
  void changeMenu(int index) {
    menuIndex.value = index;
    tabController.animateTo(index);
  }
}
