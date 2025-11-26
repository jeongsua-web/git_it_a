# 두 개의 정수를 받아 합, 차, 곱, 평균, 큰수, 작은수 구하기

# 두 개의 정수 입력 받기
a = int(input("첫 번째 정수를 입력하세요."))
b = int(input("두 번째 정수를 입력하세요."))

sum  = a + b
diff = a - b
prod = a * b
avg = sum / 2
max = max(a, b)
min = min(a,  b)

print(f"x: {a}\n y: {b}\n합: {sum}\n차: {diff}\n곱: {prod}\n평균: {avg}\n큰수: {max}\n작은수:{min}\n")
