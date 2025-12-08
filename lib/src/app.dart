import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carrot_market_clone_app/main.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool isInitStarted;

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }

  // 첫 실행 여부 확인
  void _checkFirstRun() {
    isInitStarted = prefs.getBool('isInitStarted') ?? false;
    
    // 첫 실행 또는 이후 실행 분기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isInitStarted) {
        // 첫 실행 (시작하기 안 누름) → 초기 설정 화면
        Get.offNamed('/init');
      } else {
        // 이후 실행 (시작하기 누름) → 스플래시 화면
        Get.offNamed('/splash');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // App은 단지 분기만 담당하므로 로딩 화면 표시
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
