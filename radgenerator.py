import random

def rad_gen():
    while True:
        num = random.randrange(0,101)
        num1 = random.randrange(0,101)
        num2 = random.randrange(0,101)
        num3 = random.randrange(0,101)
        yield (num, num1, num2, num3)
