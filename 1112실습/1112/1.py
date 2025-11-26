# 사용자로부터 2이상의 정수와 연산자(+, *)를 입력받아
# 해당 정수까지의 합 또는 곱을 계산하는 프로그램을 작성하세요.

a = int(input("2이상의 정수를 입력하세요: "))
input_op = input("연산자를 입력하세요 (+, *): ")

if input_op == '+':
    result = 0
    for i in range(1, a + 1):
        result += i
    print(f"1부터 {a}까지의 합은 {result}입니다.")
elif input_op == '*':
    result = 1
    for i in range(1, a + 1):
        result *= i
    print(f"1부터 {a}까지의 곱은 {result}입니다.")
else:  
    print("잘못된 연산자입니다. + 또는 *만 입력하세요.")

def sum (a):
    result = 0
    for i in range(1, a + 1):
        result += i
    return result

def multiply (a):
    result = 1
    for i in range(1, a + 1):
        result *= i
    return result

if input_op == '+':
    print(f"1부터 {a}까지의 합은 {sum(a)}입니다.")
elif input_op == '*':
    print(f"1부터 {a}까지의 곱은 {multiply(a)}입니다.")
else:
    print("잘못된 연산자입니다. + 또는 *만 입력하세요.")