import random as r
# 함수로 문제 생성
def generate_problem():
    op = r.choice(['+', '-', '*', '/'])
    a = r.randint(1, 9)
    b = r.randint(1, 9)

    if op == '/':
        while b == 0 or a % b != 0:
            a = r.randint(1, 9)
            b = r.randint(1, 9)
        result = a // b  # 정수 나눗셈   
    if op == '+':
        result = a + b
    elif op == '-':
        result = a - b
    elif op == '*':
        result = a * b
    return a, b, op, result
# 퀴즈 진행 함수
def play_quiz():
    while True:
        a, b, op, result = generate_problem()
        print(f"문제: {a} {op} {b} = ?")
        user_answer = int(input("정답을 입력하세요: "))
        if user_answer == result:
            print("정답입니다! 🎉")
            break
        else:
            print("땡!")
# 계속 여부 함수      
def continue_quiz():
    while True:
        play_quiz()
        if input("계속 하시겠습니까? (y/n): ").lower() != 'y':
            print("프로그램을 종료합니다.")
            break