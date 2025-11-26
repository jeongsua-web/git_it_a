#팀실습과제 1번
#변수로 입력받아 자동차 그리기

import turtle as t
t.shape("turtle")
CarX = int(input("자동차 길이: "))
CarY = int(input("자동차 높이: "))
WinX = int(input("자동차 창문 길이: "))
WinY = int(input("자동차 창문 높이: "))
TR = int(input("타이어 반지름: "))
CarC = input("자동차 색: ")
WinC = input("자동차 창문 색: ")
TC = input("타이어 색: ")

#위치이동 몸체 그리기
t.up()
t.goto(-CarX/2,-CarY/2)
t.down()
t.fillcolor(CarC)
t.begin_fill()
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.left(90)
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.end_fill()
#위치이동 창문 그리기
t.up()
t.goto(-WinX/2,CarY/2)
t.down()
t.fillcolor(WinC)
t.begin_fill()
t.left(180)
t.forward(WinY)
t.right(90)
t.forward(WinX)
t.right(90)
t.forward(WinY)
t.end_fill()
#위치이동 타이어 그리기
t.up()
t.goto(-CarX/4+TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.left(180)
t.circle(TR)
t.end_fill()

t.up()
t.goto(CarX/4-TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.right(180)
t.circle(TR)
t.end_fill()

t.reset()

# 바퀴달린 집 그리기 변수사용

X = int(input("집 길이: "))
Y = int(input("집 높이: "))
TR = int(input("타이어 반지름: "))
C1 = input("집 색: ")
C2 = input("지붕 색: ")
TC = input("타이어 색: ")

t.up()
t.goto(-X/2, -Y/2)
t.down()

t.fillcolor(C1)
t.begin_fill()
t.fd(X)
t.left(90)
t.fd(Y)
t.left(90)
t.fd(X)
t.left(90)
t.fd(Y)
t.end_fill()

t.goto(-X/2, Y/2)

t.fillcolor(C2)
t.begin_fill()

t.left(150)
t.fd(X)
t.right(120)
t.fd(X)
t.end_fill()

t.up()
t.goto(-X/4, -Y/2)
t.right(120)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.circle(TR)
t.end_fill()

t.goto(X/4, -Y/2)
t.fillcolor(TC)
t.begin_fill()
t.circle(TR)
t.end_fill()

t.reset()
#변수로 입력받아 자동차 점점 크게 그리기

import turtle as t
t.shape("turtle")
CarX = int(input("자동차 길이: "))
CarY = int(input("자동차 높이: "))
WinX = int(input("자동차 창문 길이: "))
WinY = int(input("자동차 창문 높이: "))
TR = int(input("타이어 반지름: "))
CarC = input("자동차 색: ")
WinC = input("자동차 창문 색: ")
TC = input("타이어 색: ")

#위치이동 몸체 그리기
t.up()
t.goto(-CarX/2,-CarY/2)
t.down()
t.fillcolor(CarC)
t.begin_fill()
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.left(90)
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.end_fill()
#위치이동 창문 그리기
t.up()
t.goto(-WinX/2,CarY/2)
t.down()
t.fillcolor(WinC)
t.begin_fill()
t.left(180)
t.forward(WinY)
t.right(90)
t.forward(WinX)
t.right(90)
t.forward(WinY)
t.end_fill()
#위치이동 타이어 그리기
t.up()
t.goto(-CarX/4+TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.left(180)
t.circle(TR)
t.end_fill()

t.up()
t.goto(CarX/4-TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.right(180)
t.circle(TR)
t.end_fill()

t.reset() #초기화
#크기키우기
CarX *= 1.5
CarY *= 1.5
WinX *= 1.5
WinY *= 1.5 
TR *= 1.5


#위치이동 몸체 그리기
t.up()
t.goto(-CarX/2,-CarY/2)
t.down()
t.fillcolor(CarC)
t.begin_fill()
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.left(90)
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.end_fill()
#위치이동 창문 그리기
t.up()
t.goto(-WinX/2,CarY/2)
t.down()
t.fillcolor(WinC)
t.begin_fill()
t.left(180)
t.forward(WinY)
t.right(90)
t.forward(WinX)
t.right(90)
t.forward(WinY)
t.end_fill()
#위치이동 타이어 그리기
t.up()
t.goto(-CarX/4+TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.left(180)
t.circle(TR)
t.end_fill()

t.up()
t.goto(CarX/4-TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.right(180)
t.circle(TR)
t.end_fill()

t.reset() #초기화
#크기키우기
CarX *= 1.5
CarY *= 1.5
WinX *= 1.5
WinY *= 1.5 
TR *= 1.5


#위치이동 몸체 그리기
t.up()
t.goto(-CarX/2,-CarY/2)
t.down()
t.fillcolor(CarC)
t.begin_fill()
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.left(90)
t.forward(CarX)
t.left(90)
t.forward(CarY)
t.end_fill()
#위치이동 창문 그리기
t.up()
t.goto(-WinX/2,CarY/2)
t.down()
t.fillcolor(WinC)
t.begin_fill()
t.left(180)
t.forward(WinY)
t.right(90)
t.forward(WinX)
t.right(90)
t.forward(WinY)
t.end_fill()
#위치이동 타이어 그리기
t.up()
t.goto(-CarX/4+TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.left(180)
t.circle(TR)
t.end_fill()

t.up()
t.goto(CarX/4-TR,-CarY/2)
t.down()
t.fillcolor(TC)
t.begin_fill()
t.right(180)
t.circle(TR)
t.end_fill()

t.done()

