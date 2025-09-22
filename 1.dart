void main()
{
  /*
  var name = '정수아';
  print(name);
  
  name = '장서은';
  print(name);
  
  var myName = '정수아';
  print(myName);
  
  int number1 = 12;
  print(number1);
  
  double number2 = 13.4;
  print(number2);
  
  var number3 = -12.4;
  print(number3);
  */
  
  /*
  String name = '정수아';
  String role = '학생';
  
  print(role + ' ' + name + '는 ' + '명석한 두뇌를 가졌다.');
  print('$name는 $role이다.');
  print('${role + ' ' + name}입니다.');
  */
  
  /*
  bool isTrue = true;
  bool isFalse = false;
  
  print(isTrue);
  print(isFalse);
  */
  
  /*
  var name = '정수아';
  print(name);
  
  name = 12;
  print(name); //오류 발생 var로 선언한 변수는 첫번째 선언했을때 지정된 값의 타입으로 고정됨.
  */
  
  /*
  //dynamic 타입 사용.
  dynamic name = '정수아';
  name = 13;
  print(name);
  
  //var 타입을 dynamic타입처럼 사용하는 법
  var role;
  role = 'student';
  role = 13;
  print(role);
  */
  
  /*
  List fruits = ['키위', '바나나', '포도'];
  List<String> flowers = ['프리지아', '데이지', '국화'];
  
  print(fruits);
  print(flowers);
  
  print(fruits[0]);
  print(fruits[1]);
  print(fruits[2]);
  
  print(fruits.length);
  */
  
  /*
  Map dictionary = {
    'apple' : '사과',
    'admit' : '승인',
    'area' : '영역',
  };
  
  Map<String, String> dictionary2 = {
    'banana' : '바나나',
    'babo' : '바보',
    'babDeaGaRi' : '밥대가리',
  };
  
  print(dictionary);
  print(dictionary2);
  
  dictionary2.addAll({
    'bear' : '곰'
  });
  
  print(dictionary2);
  
  dictionary2['bear'] = '찢다';
  print(dictionary2);
  
  dictionary2.remove('bear');
  print(dictionary2);
  
  print(dictionary2.keys);
  print(dictionary2.keys.toList());
  
  print(dictionary2.values);
  print(dictionary2.values.toList());
  */
  
  /*
  final name = 'sua';
  final String name2 = 'jeong';
  //런타임에 값이 지정되어도 상관없음
  
  const name3 = 'suah';
  const String name4 = 'jung';
  //빌드타임에 꼭 값이 있어야 함
  
  print('$name, $name2, $name3, $name4');
  
  final now = new DateTime.now();
  print(now);
  
  const now2 = new DateTime.now(); //빌드타입의 값을 알 수 없으면 선언 할 수 없다.
  print(now2);
  */
  
  /*
  int a = 5; //null이 될 수 없는 변수
  int? b; //null이 될 수 있는변수
  ! --> 강제 null 변환
  ?. --> null이면 사용하지 않겠다.
  */
  

}
