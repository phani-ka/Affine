package main

import "fmt"

func main() {
	a := [3]int{1, 2, 3}
	var b *int = &a[0]
	var c *int = &a[1]
	fmt.Printf("%v %p %p\n", a, *b, *c)
}
