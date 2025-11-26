import sys

user_pass = input("패스워드를 입력하시오: ")  # 예: abc12

letters = ['a','b','c','d','e','f','g','h','i','j',
           'k','l','m','n','o','p','q','r','s','t',
           'u','v','w','x','y','z']

digits = [str(i) for i in range(10)]  # '0'~'9'

# 5중 루프: 알파벳 3개 + 숫자 2개
for l1 in letters:
    for l2 in letters:
        for l3 in letters:
            for d1 in digits:
                for d2 in digits:
                    guess = l1 + l2 + l3 + d1 + d
                    if guess == user_pass:
                        print("당신의 패스워드는 " + guess)
                        sys.exit()
