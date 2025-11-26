import turtle as t

# 팀 실습과제 1번 수정
carSize = int(input("자동차의 크기를 입력하시오"))
carColor = input("자동차의 색깔을 입력하시오")

# 자동차 사이즈 변수 설정 
body_width = 40 * carSize
body_height = 20 * carSize
window_width = 20 * carSize
window_height = 10 * carSize
wheel_radius = 5 * carSize

t.shape("turtle")
t.up()
t.goto(-body_width/2, -body_height/2)
t.down()

# 그리기 시작 - 자동차 몸채 
t.fillcolor(carColor)
t.begin_fill()
t.forward(body_width)
t.left(90)
t.forward(body_height)
t.left(90)
t.forward(body_width)
t.left(90)
t.forward(body_height)
t.end_fill()

# 창문으로 이동
t.up()
t.goto(-window_width/2, body_height/2)
t.down()

# 창문 그리기 
t.fillcolor("#87CEEB")
t.begin_fill()
t.lt(180)
t.fd(window_height)
t.rt(90)
t.fd(window_width)
t.rt(90)
t.fd(window_height)
t.rt(90)
t.fd(window_width)
t.end_fill()

# 바퀴 그리기
t.up()
t.goto(-body_width/4, -body_height/2)
t.down()
t.fillcolor("black")
t.begin_fill()
t.left(180)
t.circle(wheel_radius)
t.end_fill()

t.up()
t.goto(body_width/4, -body_height/2)
t.down()
t.fillcolor("black")
t.begin_fill()
t.right(180)
t.circle(wheel_radius)
t.end_fill()

t.done()
