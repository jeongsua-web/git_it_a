# 3명의 학생의 이름 국,영,수 점수를 입력받아 list변수에 저장 (중첩리스트, 반복구조 사용)

students = []

for i in range(3):  # 3명의 학생 입력
    name = input(f"{i+1}번째 학생 이름을 입력하세요: ")
    korean = int(input("국어 점수를 입력하세요: "))
    english = int(input("영어 점수를 입력하세요: "))
    math = int(input("수학 점수를 입력하세요: "))
    
    # 한 학생의 정보를 리스트로 만들어서 students에 추가
    students.append([name, korean, english, math])


# 표 머리글 출력
print("\n{:<10} {:<6} {:<6} {:<6} {:<6} {:<6}".format("이름", "국어", "영어", "수학", "총점", "평균"))

# 학생별 정보 출력
for s in students:
    name, korean, english, math = s
    total = korean + english + math
    avg = total / 3
    print("{:<10} {:<6} {:<6} {:<6} {:<6} {:.2f}".format(name, korean, english, math, total, avg))
