# 복권뽑기

import random

lottery_number = int(input("숫자 2자리를 입력하세요 "))
winning_number = random.randrange(10,100)

ten1 = lottery_number // 10
one1 = lottery_number % 10

ten2 = winning_number // 10
one2 = winning_number % 10


if lottery_number == winning_number:
    print("100만원 당첨!")
elif (ten1 == ten2) or (one1 == one2):
    print("50만원 당첨..!")
else:
    print("꽝 ㅋ")
