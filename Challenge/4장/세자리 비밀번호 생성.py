# 알파벳 소문자와 숫자 중 3글자를 랜덤으로 선택해 패스워드를 생성하는 프로그램

import string
import random

letters = string.ascii_lowercase + string.digits

password = random.choices(letters, k=3)

print(password)
