def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)
loop = 1
while loop == 1:
    num = int(input("팩토리얼을 계산할 숫자를 입력하세요 (종료하려면 0 입력): "))
    if num == 0:
        print("프로그램을 종료합니다.")
        break
    else:
        result = factorial(num)
        print(f"{num}! = {result}")
    int
