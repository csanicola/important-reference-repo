# Creating a Car Class
# allowing you to create car instances, accelerate them, and display their current speeds
# from the coursera course for python for applied data science - 'Objects and Classes' section

class Car:
    # Class attribute (shared by all instances)
    max_speed = 120  # Maximum speed in km/h

    # Constructor method (initialize instance attributes)
    def __init__(self, make, model, color, speed=0):
        self.make = make
        self.model = model
        self.color = color
        self.speed = speed  # Initial speed is set to 0

    # Method to accelerate the car
    def accelerate(self, acceleration):
        if self.speed + acceleration <= Car.max_speed:
            self.speed += acceleration
        else:
            self.speed = Car.max_speed

    # Method to get the current speed of the car
    def get_speed(self):
        return self.speed


# Create objects (instances) of the Car class
car1 = Car("Toyota", "Camry", "Blue")
car2 = Car("Honda", "Civic", "Red")

# Accelerate the cars
car1.accelerate(30)
car2.accelerate(20)

# Print the current speeds of the cars
print(f"{car1.make} {car1.model} is currently at {car1.get_speed()} km/h")
print(f"{car2.make} {car2.model} is currently at {car2.get_speed()} km/h")
