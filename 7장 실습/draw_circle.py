import turtle as t
import random as r

t.speed(0)

def draw_circles(x,y):
    t.penup()
    t.goto(x,y)
    t.pendown()
    t.begin_fill()
    t.color(r.random(), r.random(), r.random())
    t.circle(r.randint(50,100))
    t.end_fill()
    
s = t.Screen()
s.onscreenclick(draw_circles)
        
t.done()
