import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  // 인증 상태
  RxBool isAuthenticated = false.obs;
  RxString authMessage = '인증 확인 중...'.obs;

  /// 인증 확인 로직 (목업)
  Future<void> checkAuthentication() async {
    try {
      // 1초 대기 (인증 체크 시뮬레이션)
      await Future.delayed(const Duration(seconds: 1));

      // 목업: 항상 인증 성공으로 설정
      // 실제로는 API 호출 또는 로컬 토큰 확인
      isAuthenticated.value = true;
      authMessage.value = '인증 완료!';
      print('✅ 인증 성공');
    } catch (e) {
      // 에러 처리
      isAuthenticated.value = false;
      authMessage.value = '인증 중 오류가 발생했습니다.';
      print('⚠️ 인증 에러: $e');
    }
  }

  /// 인증 재시도
  Future<void> retryAuthentication() async {
    isAuthenticated.value = false;
    authMessage.value = '인증 확인 중...';
    await checkAuthentication();
  }

  /// 로그아웃 함수
  void logout() {
    isAuthenticated.value = false;
    authMessage.value = '로그아웃되었습니다.';
    print('🚪 로그아웃 완료');
  }
}

