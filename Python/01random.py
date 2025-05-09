import random

options = ("rock", "paper", "scissors")

player = None

computer = random.choice(options)

player = input("Enter a choice(rock, paper, scissors):")

print(f"player: {player}")
print(f"computer: {computer}")