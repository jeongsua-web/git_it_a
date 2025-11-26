import random
import operator

# 연산자와 함수 매핑
ops = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.floordiv  # 정수 나눗셈
}

while True:
    # 10~99 사이 숫자 2개 랜덤 선택
    a = random.randint(10, 99)
    b = random.randint(10, 99)
    
    # 연산자 랜덤 선택
    op_symbol = random.choice(list(ops.keys()))
    op_func = ops[op_symbol]
    
    # 나눗셈인 경우 0으로 나누는 문제 방지
    if op_symbol == '/':
        while b == 0 or a % b != 0:  # 나눗셈은 나머지 없이
            a = random.randint(10, 99)
            b = random.randint(10, 99)
    
    # 문제 출력
    print(f"\n문제: {a} {op_symbol} {b} = ?")
    
    # 사용자가 정답 맞출 때까지 반복
    while True:
        try:
            answer = int(input("정답을 입력하세요: "))
            correct = op_func(a, b)
            if answer == correct:
                print("정답입니다! 🎉")
                break
            else:
                print("틀렸습니다. 다시 시도해보세요.")
        except ValueError:
            print("숫자를 입력해주세요.")

    # 계속할지 물어보기
    cont = input("계속 하시겠습니까? (y/n): ").lower()
    if cont != 'y':
        print("프로그램을 종료합니다.")
        break
