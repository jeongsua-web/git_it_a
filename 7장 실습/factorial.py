#1 정수값 받아 팩토리얼 값 계산.
n = int(input("팩토리얼을 계산할 숫자를 입력하세요: "))
fac = 1
for i in range(1,n+1):
    fac *= i

print(f"{n}! = {fac}")

#2 함수이용.
def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n-1)

n = int(input("팩토리얼을 계산할 숫자를 입력하세요: "))
print(f"{n}! = {factorial(n)}")

#3 사용자가 0을 입력하면 프로그램 종료
def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)
    
while True:
    num = int(input("팩토리얼을 계산할 숫자를 입력하세요 (종료하려면 0 입력): "))
    if num == 0:
        print("프로그램을 종료합니다.")
        break
    else:
        result = factorial(num)
        print(f"{num}! = {result}")
    

