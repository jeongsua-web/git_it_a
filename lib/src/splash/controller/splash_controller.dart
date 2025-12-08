import 'package:get/get.dart';
import '../enum/StepType.dart';

class SplashController extends GetxController {
  // 현재 진행 단계
  Rx<StepType> currentStep = StepType.dataLoad.obs;

  // 단계 변경 메서드
  void changeStep(StepType newStep) {
    currentStep.value = newStep;
  }

  // 다음 단계로 이동
  void nextStep() {
    final nextStep = currentStep.value.nextStep;
    if (nextStep != null) {
      currentStep.value = nextStep;
    } else {
      // 모든 단계 완료 - 다음 화면으로 네비게이션
      navigateToNext();
    }
  }

  // 다음 화면으로 이동
  void navigateToNext() {
    // 스플래시 완료 후 네비게이션 로직
    // Get.offNamed('/home') 또는 원하는 라우트로 변경
  }
}
