import turtle
import random

# 색상 목록
colors = ["red", "purple", "blue", "green", "yellow", "orange"]

# 배경색 설정
turtle.bgcolor("black")

# 거북이 설정
t = turtle.Turtle()
t.speed(0)       # 속도 최대
t.width(3)       # 선 두께 설정

# 초기 선 길이
length = 10

# 선 길이가 500 미만일 동안 반복
while length < 500:
    t.forward(length)                      # length만큼 전진
    t.pencolor(random.choice(colors))      # 랜덤 색상 선택
    t.right(89)                            # 오른쪽으로 89도 회전
    length += 5                            # 선 길이 증가

turtle.done()
