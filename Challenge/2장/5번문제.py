# 5번 문제 
radius = 50 # 초기 반지름

import turtle as t

# 첫번째 원 그리기 
t.circle(radius)

# 이동 
t.up()
t.goto(100,0)
t.down()

# 두번째 원 그리기 
radius += 20
t.circle(radius)

# 이동 
t.up()
t.goto(200,0)
t.down()

# 세번쨰 원 그리기 
radius += 20
t.circle(radius)

t.done()
