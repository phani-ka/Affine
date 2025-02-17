capitals = {"USA": "Washington D.C",
            "INDIA": "New Delhi",
            "china": "Beijing",
            "Russia": "Moscow"}


#print(type(capitals))
#print(capitals.get("JAPAN"))


if capitals.get("INDIA"):
    print("capitals details are exists")
else:
    print("capitals details doesnot exists")
    
    
    
    
for key,value in capitals.items():
    print(f"{key}:{value}\t")