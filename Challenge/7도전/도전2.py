import random as r
# 리스트에 저장 
numbers = r.sample(range(1,101),10)

def max_number():
    numbers.sort()
    return numbers.pop()
    
print(f"리스트 {numbers}에서 최고의 숫자는 {max_number()}입니다.")