import random as r
import turtle as t

t.speed(0)

def polygon():
    angle = r.choice([3,4,5,6,7,8,9])
    side = r.randint(30,70)
    for i in range(0, angle):
        t.fd(side)
        t.lt(360/angle)


def draw_polygon():
    x = r.randint(-200, 200)
    y = r.randint(-200, 200)
    t.penup()
    t.goto(x,y)
    t.pendown()
    t.begin_fill()
    t.color(r.random(), r.random(), r.random())
    polygon()
    t.end_fill()
    
def darw_many_polygons():
    a = r.randint(5,30)
    for _ in range(0, a):
        draw_polygon()

darw_many_polygons()       
t.done()


