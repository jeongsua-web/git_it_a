enum StepType {
  dataLoad(0, '데이터 로드'),
  authCheck(1, '인증 확인');

  final int stepIndex;
  final String displayName;

  const StepType(this.stepIndex, this.displayName);

  // 초기 상태 확인
  static const int initialState = 0; // dataLoad의 stepIndex
  
  bool get isInitialState => stepIndex == initialState;

  // 단계 진행 여부 확인
  bool get isCompleted => false;

  // 다음 단계 반환
  StepType? get nextStep {
    final steps = StepType.values;
    final currentIndex = steps.indexOf(this);
    
    if (currentIndex < steps.length - 1) {
      return steps[currentIndex + 1];
    }
    return null; // 마지막 단계
  }

  // 단계 설명
  String get description {
    switch (this) {
      case StepType.dataLoad:
        return '앱 데이터를 로드 중입니다...';
      case StepType.authCheck:
        return '사용자 인증을 확인 중입니다...';
    }
  }
}

