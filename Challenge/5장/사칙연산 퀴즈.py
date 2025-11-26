# 사칙연산 퀴즈

import random as r

num1 = r.randint(10,99)
num2 = r.randint(10,99)

sum1 = num1 + num2
sum2 = int(input(f"{num1} + {num2} = ?? "))

if sum1 == sum2:
    print("정답!")
else:
    print("오답!")

diff1 = num1 - num2
diff2 = int(input(f"{num1} - {num2} = ?? "))

if diff1 == diff2:
    print("정답!")
else:
    print("오답!")

prod1 = num1 * num2
prod2 = int(input(f"{num1} X {num2} = ?? "))

if prod1 == prod2:
    print("정답!")
else:
    print("오답!")

div1 = num1 // num2
div2 = int(input(f"{num1} ÷ {num2} = ?? "))

if div1 == div2:
    print("정답!")
else:
    print("오답!")
