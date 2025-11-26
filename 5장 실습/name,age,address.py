# 사용자에게 이름, 나이, 주소를 입력받아 list 저장.

user = []

user.append(input("이름: "))
user.append(input("나이: "))
user.append(input("주소: "))

print(f"넌 {user[0]}, 나이는 {user[1]}, {user[2]}에 살고 있군.")
