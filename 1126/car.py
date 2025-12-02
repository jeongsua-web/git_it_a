from turtle import *
import random
class Car:
    def __init__ (self, speed, color, fname):
        self.speed = speed
        self.color = color
        self.turtle = Turtle()
        self.turtle.shape(fname)
        
    def drive(self, distance):
        self.turtle.forward(distance)
            
    def left_turn(self, degree):
        self.turtle.left(degree)
            
# register_shape("car.gif")
# register_shape("car1.gif")
# myCar = Car(0, "red", "car.gif")
# yourCar = Car(0, "blue", "car1.gif")
    
# for i in range(100):
#     myCar.drive(300)
#     myCar.left_turn(90)
#     yourCar.drive(100)
#     yourCar.left_turn(60)

register_shape("car.gif")

car_list = []
for _ in range(10):
    car_list.append(Car(random.randint(1,10), random.choice(["red","blue","green","yellow"]), "car.gif"))
    
for _ in range(100):
    for car in car_list:
        car.drive(random.randint(50,100))
        car.left_turn(random.choice([0,90,180,270]))
