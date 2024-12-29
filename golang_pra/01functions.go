/* package main

import "fmt"

func main() {
	// function call
	fmt.Println("Hello ", "playground")
}



package main

import "fmt"

func sayMessage(msg string, idx int) {
	fmt.Printf("%v %v \n", idx, msg)
}

func main() {
	// function call
	for i := 0; i < 5; i++ {
		sayMessage("Hello go", i)
	}

}


package main

import "fmt"

func sayGreeting(greeting, name *string) {
	fmt.Println(*greeting, *name)
	*name = "phani"
	fmt.Println(*name)
}

func main() {
	greeting := "Hello"
	name := "Stacey"
	sayGreeting(&greeting, &name)
	fmt.Println(name)
}


package main

import "fmt"

func sum(msg string, values ...int) {
	fmt.Println(values)
	result := 0
	for _, v := range values {
		result += v

	}
	fmt.Println(msg, result)
}
func main() {
	sum("The sum is: ", 1, 2, 3, 4, 5, 7)
}


package main

import "fmt"

func divide(a, b float64) float64 {
	if b == 0.0 {
		panic("Cannot divide by zero")
	}
	return a / b
}

func main() {
	// function call
	d := divide(4.0, 2.0)

	fmt.Println(d)

}
*/

package main

import "fmt"

func main() {
	for i := 0; i < 5; i++ {
		func(i int) {
			fmt.Println(i)
		}(i)
	}
}
