import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWriteController extends GetxController {
  // 선택된 이미지 리스트
  final RxList<String> selectedImages = <String>[].obs;

  // 제목
  final RxString title = ''.obs;
  final TextEditingController titleController = TextEditingController();

  // 선택된 카테고리
  final RxString selectedCategory = ''.obs;

  // 가격
  final RxString price = ''.obs;
  final TextEditingController priceController = TextEditingController();

  // 나눔하기 여부
  final RxBool isShare = false.obs;

  // 상품 설명
  final RxString description = ''.obs;
  final TextEditingController descriptionController = TextEditingController();

  // 거래 장소
  final RxString location = '화곡동'.obs;

  @override
  void onInit() {
    super.onInit();
    // 초기화 로직
  }

  @override
  void onClose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // 이미지 추가
  void addImage(String imagePath) {
    if (selectedImages.length < 10) {
      selectedImages.add(imagePath);
    }
  }

  // 이미지 삭제
  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
    }
  }

  // 제목 업데이트
  void updateTitle(String value) {
    title.value = value;
  }

  // 카테고리 선택
  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // 가격 업데이트
  void updatePrice(String value) {
    // 숫자만 입력 가능하도록 필터링
    final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    price.value = numericValue;
    priceController.text = numericValue;
    priceController.selection = TextSelection.fromPosition(
      TextPosition(offset: numericValue.length),
    );
  }

  // 나눔하기 토글
  void toggleShare(bool value) {
    isShare.value = value;
    if (value) {
      price.value = '0'; // 나눔하기 선택 시 가격 0원으로 설정
      priceController.text = '0';
    } else {
      // 나눔하기 해제 시 가격 초기화
      price.value = '';
      priceController.text = '';
    }
  }

  // 설명 업데이트
  void updateDescription(String value) {
    description.value = value;
  }

  // 장소 업데이트
  void updateLocation(String value) {
    location.value = value;
  }

  // 폼 유효성 검사
  bool validateForm() {
    if (selectedImages.isEmpty) {
      Get.snackbar('알림', '최소 1개 이상의 이미지를 선택해주세요.');
      return false;
    }
    if (title.value.trim().isEmpty) {
      Get.snackbar('알림', '제목을 입력해주세요.');
      return false;
    }
    if (selectedCategory.value.isEmpty) {
      Get.snackbar('알림', '카테고리를 선택해주세요.');
      return false;
    }
    if (!isShare.value && price.value.trim().isEmpty) {
      Get.snackbar('알림', '가격을 입력하거나 나눔하기를 선택해주세요.');
      return false;
    }
    return true;
  }

  // 상품 등록
  Future<void> submitProduct() async {
    if (!validateForm()) {
      return;
    }

    try {
      // TODO: Repository를 통해 상품 등록 API 호출
      Get.snackbar('성공', '상품이 등록되었습니다.');
      Get.back(); // 이전 화면으로 돌아가기
    } catch (e) {
      Get.snackbar('오류', '상품 등록에 실패했습니다.');
    }
  }
}
