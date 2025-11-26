import random

answer = "yes"

# 2자리 숫자 2개 생성
a = random.randint(10, 99)
b = random.randint(10, 99)

while answer == "yes":
    operators = ['+', '-', '*', '/']
    op = random.choice(operators)

    print(f"\n{a} {op} {b} = ?")

    user_answer = float(input("당신의 답을 입력하세요: "))

    if op == '+':
        correct = a + b
    elif op == '-':
        correct = a - b
    elif op == '*':
        correct = a * b
    else:
        correct = round(a / b, 2)  # 소수점 둘째자리까지 비교

    if op == '/':
        if abs(user_answer - correct) < 0.01:
            print("정답!")
        else:
            print(f"오답! 정답은 {correct}입니다.")
    else:
        if user_answer == correct:
            print("정답!")
        else:
            print(f"오답! 정답은 {correct}입니다.")

    answer = input("계속할까요? (yes/no): ")

    # 다음 문제를 위해 새 숫자 생성
    a = random.randint(10, 99)
    b = random.randint(10, 99)
