import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../enum/StepType.dart';
import '../../common/controller/data_load_controller.dart';
import '../../common/controller/authentication_controller.dart';
import '../../common/components/getx_listener.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController splashController;
  late DataLoadController dataLoadController;
  late AuthenticationController authenticationController;

  @override
  void initState() {
    super.initState();
    _initCall();
  }

  void _initCall() {
    splashController = Get.put(SplashController());
    dataLoadController = Get.find<DataLoadController>();
    authenticationController = Get.find<AuthenticationController>();
    splashController.changeStep(StepType.dataLoad);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listenToSteps();
  }

  void _listenToSteps() {
    splashController.currentStep.listen((StepType newStep) {
      _handleStepChange(newStep);
    });
  }

  void _handleStepChange(StepType step) {
    switch (step) {
      case StepType.dataLoad:
        _onDataLoadStart();
        break;
      case StepType.authCheck:
        _onAuthCheckStart();
        break;
    }
  }

  void _onDataLoadStart() {
    debugPrint('데이터 로드 시작: ${StepType.dataLoad.description}');
    // 2초 후 isDataLoad를 true로 변경
    dataLoadController.loadData();
  }

  void _onAuthCheckStart() {
    debugPrint('인증 확인 시작: ${StepType.authCheck.description}');
    // 인증 확인 (1초 후 완료)
    authenticationController.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return GetxListener<DataLoadController>(
      controller: dataLoadController,
      observable: dataLoadController.isDataLoad,
      listener: (previous, current) {
        if (current == true) {
          debugPrint('데이터 로드 완료! authCheck 단계로 진행');
          splashController.changeStep(StepType.authCheck);
        }
      },
      child: GetxListener<AuthenticationController>(
        controller: authenticationController,
        observable: authenticationController.isAuthenticated,
        listener: (previous, current) {
          if (current == true) {
            debugPrint('인증 성공! 루트 화면으로 이동');
            Get.offNamed('/root');
          } else {
            debugPrint('인증 실패! 로그인 화면으로 이동');
            Get.offNamed('/login');
          }
        },
        child: _SplashView(
          splashController: splashController,
        ),
      ),
    );
  }
}

// 퍼블리싱을 담당하는 내부 클래스
class _SplashView extends StatelessWidget {
  final SplashController splashController;

  const _SplashView({required this.splashController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff212123),
              const Color(0xff1a1a1c),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고 또는 앱 아이콘
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/logo_simbol.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // 앱 이름
              const Text(
                '당근마켓',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              
              // 슬로건
              Text(
                '당신 근처의 당근마켓',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 60),
              
              // 로딩 인디케이터
              const CircularProgressIndicator(
                color: Color(0xffed7738),
                strokeWidth: 3,
              ),
              const SizedBox(height: 30),
              
              // 현재 진행 단계 표시
              Obx(
                () => Text(
                  splashController.currentStep.value.description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}