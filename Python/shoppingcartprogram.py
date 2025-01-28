foods = []
prices = []
total = 0


while True:
    food = input("Enter the food item to buy(q to quit):")
    if food.lower() == 'q':
        break
    else:
        price = float(input(f"enter the price of a {food}: $"))
        foods.append(food)
        prices.append(price)
print("----- Your Cart -----")
for f in foods:
    print(f , end=" ") 
for p in prices:
    total += p
print()
print(f"Your total is: ${total}")