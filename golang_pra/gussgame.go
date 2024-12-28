package main

import (
	"fmt"
)

func main() {
	number := 50
	guess := 50
	if guess < number {
		fmt.Println("Too low")
	}
	if guess > number {
		fmt.Println("Too high")
	}
	if guess == number {
		fmt.Println("You got it")
	}
	fmt.Println(number <= guess, number >= guess, number != guess)
}
