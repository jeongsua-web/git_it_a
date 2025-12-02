from turtle import *
import random as r

# Car 클래스
class Car:
    def __init__(self, fname, x, y, name):
        self.name = name
        self.turtle = Turtle()
        self.turtle.shape(fname)
        self.turtle.penup()
        self.turtle.goto(x, y)
        
    def drive(self, distance):
        self.turtle.forward(distance)
        
register_shape("car.gif")

# 자동차 배치
car_list = []
for i in range(5):
    x = -250
    y = 0 + i * 50
    car_list.append(Car("car.gif", x, y, f"Car{i+1}"))

# 결승선 그리기
finish = Turtle()
finish.hideturtle()
finish.penup()
finish.goto(300, 200)
finish.pendown()
finish.right(90)
finish.forward(300)
finish.penup()
finish.goto(300, 210)
finish.write("FINISH", align="center", font=("Arial", 16, "bold"))

# 랭킹 기록
ranking = []

# 경주
while len(ranking) < len(car_list):
    for car in car_list:
        if car not in ranking:
            car.drive(r.randint(5, 20))
            
            if car.turtle.xcor() >= 300:  # 결승선 도착
                ranking.append(car)
                
                # 도착한 자동차 바로 옆에 등수 표시
                rank_turtle = Turtle()
                rank_turtle.hideturtle()
                rank_turtle.penup()
                rank_turtle.goto(car.turtle.xcor() + 10, car.turtle.ycor())  # 자동차 오른쪽
                rank_turtle.write(f"{len(ranking)}등", font=("Arial", 15, "bold"))

done()
