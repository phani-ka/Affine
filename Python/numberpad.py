num_pad = ((1,2,3),(4,5,6),(7,8,9),("*", 0, "#"))

for row in num_pad:
    for n in row:
        print(n, end=" ")
    print()