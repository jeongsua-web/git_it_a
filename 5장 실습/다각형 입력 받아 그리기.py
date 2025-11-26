import turtle as t

polygon = t.textinput("polygon", "도형을 입력하세요")
size = int(t.textinput("polygon", "크기를 입력하세요."))

def draw_polygon (sides, length):
    angle = 360/sides
    for _ in range(sides):
        t.fd(length)
        t.lt(angle)

if polygon == "사각형":
    draw_polygon(4, size)
elif polygon == "삼각형":
    draw_polygon(3, size)
elif polygon == "오각형":
    draw_polygon(5, size)
elif polygon == "육각형":
    draw_polygon(6, size)
elif polygon == "원" or "동그라미":
    t.circle(size)
else:
    t.write("지원하지 않는 도형")

t.done()
