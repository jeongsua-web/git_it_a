import 'package:carrot_market_clone_app/src/common/components/btn.dart';
import 'package:carrot_market_clone_app/src/common/components/app_font.dart';
import 'package:carrot_market_clone_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitStartPage extends StatelessWidget {
  const InitStartPage({super.key});

  void _onStartPressed() async {
    // isInitStarted를 true로 저장하여 다음 실행 시 시작하기 화면을 건너뜀
    await prefs.setBool('isInitStarted', true);
    // 스플래시 화면으로 이동
    Get.offNamed('/splash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset('assets/images/logo_simbol.png'),
            ),
            const SizedBox(height: 40),
            const AppFont(
              '당신 근처의 당근마켓',
              fontWeight: FontWeight.bold,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(height: 40),
            AppFont(
              '중고 거래부터 동네 정보까지, \n지금 내 동네를 선택하고 시작해보세요!',
              align: TextAlign.center,
              size: 18,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25 + Get.mediaQuery.padding.bottom, // iOS safe area 고려 - 화면과 디바이스 정보 가져오는 클래스
        ),
        child: Btn(
          onTap: _onStartPressed,
          child: const AppFont(
            '시작하기',
            align: TextAlign.center,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}