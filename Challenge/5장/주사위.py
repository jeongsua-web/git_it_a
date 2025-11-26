# 주사위 던지기 게임 
import random
import turtle as t

# 화면 세팅
screen = t.Screen()
screen.setup(500, 500)

print("주사위 던지기 게임을 시작합니다.")

# 주사위 이미지 등록
images = ["one.gif", "two.gif", "three.gif", "four.gif", "five.gif", "six.gif"]
for img in images:
    screen.addshape(img)

# 거북이 객체 생성 
dice_turtle = t.Turtle()
dice_turtle.penup()

# 주사위 굴리기
dice = random.randint(1, 6)
print(f"주사위 결과: {dice}")

# 결과 이미지
dice_turtle.shape(images[dice - 1])

t.done()
