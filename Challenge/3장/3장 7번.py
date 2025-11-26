# 사용자로부터 정수를 입력 받아 정수의 자리 합을 계산하는 프로그램

a = int(input("정수를 입력하시오."))

thousands = a // 1000
rem_thousands = a % 1000

hundreds = rem_thousands // 100
rem_hundreds = rem_thousands % 100

tens = rem_hundreds // 10
ones = rem_hundreds % 10

sum = thousands + hundreds + tens + ones

print(f"입력받은 정수: {a}\n자리수의 합: {sum}")
