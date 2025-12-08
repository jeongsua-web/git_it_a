import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/common/controller/data_load_controller.dart';
import 'src/common/controller/authentication_controller.dart';
import 'src/common/controller/bottom_nav_controller.dart';
import 'src/init/page/init_start_page.dart';
import 'src/splash/page/splash_page.dart';
import 'src/root.dart';
import 'src/home/page/home_page.dart';
import 'src/user/login/page/login_page.dart';
import 'src/product/write/page/product_write_page.dart';
import 'src/product/write/controller/product_write_controller.dart';
import 'src/product/repository/product_repository.dart';

late SharedPreferences prefs; // 값을 저장하고 관리 하기 위한 변수 - 작은 저장소 열기

int count = 0; // count 변수 전역으로 선언

// 초기 바인딩 - 앱 시작 시 의존성 주입
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataLoadController());
    Get.put(AuthenticationController());
    Get.put(BottomNavController());
    Get.put(ProductRepository(collection: 'products'));
    Get.lazyPut(() => ProductWriteController());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance(); // 작은 저장소 열기

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '당근마켓 클론 코딩',
      initialRoute: '/',
      initialBinding: InitialBinding(), // ← 초기 바인딩 설정
      theme: ThemeData(appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0xff212123),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xff212123),
      ),
      getPages: [
        // 루트 페이지 - App에서 첫 실행 여부 판단
        GetPage(name: '/', page: () => const App()),
        
        // 스플래시 화면 (로그인 후 매번)
        GetPage(name: '/splash', page: () => const SplashPage()),
        
        // 초기 설정 화면 (첫 실행 시에만)
        GetPage(name: '/init', page: () => const InitStartPage()),
        
        // Root 화면 (bottomNavigation 포함)
        GetPage(name: '/root', page: () => const RootPage()),
        
        // 로그인 화면 (인증 실패 시)
        GetPage(name: '/login', page: () => const LoginPage()),
        
        // 홈 화면 (메인)
        GetPage(name: '/home', page: () => const HomePage()),
        
        // 상품 글쓰기 화면
        GetPage(name: '/product/write', page: () => const ProductWritePage()),
      ],
    );
  }
}
