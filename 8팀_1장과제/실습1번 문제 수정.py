import turtle as t

# 팀실습과제 1번 수정
carSize = input("자동차 크기를 입력하시오.")
carColor = input("자동차 색깔을 입력하시오.")

t.shape("turtle")
t.up()
t.goto(-200,-100)
t.down()

t.fillcolor(carColor)
t.begin_fill()
t.forward(400)
t.left(90)
t.forward(200)
t.left(90)
t.forward(400)
t.left(90)
t.forward(200)
t.end_fill()

t.up()
t.goto(-100,100)
t.down()
t.fillcolor(carColor)
t.begin_fill()

t.left(180)
t.forward(100)
t.right(90)
t.forward(200)
t.right(90)
t.forward(100)
t.end_fill()

#바퀴그리
t.up()
t.goto(-50,-100)
t.down()
t.fillcolor("black")
t.begin_fill()
t.left(180)
t.circle(50)
t.end_fill()

t.up()
t.goto(50,-100)
t.down()
t.fillcolor("black")
t.begin_fill()
t.right(180)
t.circle(50)
t.end_fill()

t.done()

