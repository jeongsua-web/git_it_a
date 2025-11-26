'''
도형종류(0~8입력, 3~8각형 원:0 1,2,7입력 시 오류.
색깔 red, yellow, blue, green, black
화면 중앙에 그리기 - if문, for문, list
'''

import turtle as t

t.penup()
t.goto(-50, -50)
t.pendown()


n = int(t.textinput("도형", "몇각형으로 그릴까요? (0~8)\n !1,2,7은 선택 불가능"))
c = int(t.textinput("도형", "색깔을 지정하세요 (1. red 2. yellow 3. blue 4. green 5. black)"))

color_list = ["red", "yellow", "blue", "green", "black"]
angle = 360/n

if n in [1,2,7]:
    t.write("지정되지 않은 번호! 그림판을 종료합니다.")
    t.bye()
elif n == 0: #원 
    t.color(color_list[c-1])
    t.fillcolor(color_list[c-1])
    t.begin_fill()
    t.circle(100)
    t.end_fill()
else: #다각형 
    t.color(color_list[c-1])
    t.fillcolor(color_list[c-1])
    t.begin_fill()
    for _ in range(n):
        t.fd(100)
        t.lt(angle)
    t.end_fill()

