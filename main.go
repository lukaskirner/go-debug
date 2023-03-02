package main

import "time"

func main() {
	i := 0
	for {
		time.Sleep(1 * time.Second)
		i++
		println(i)
	}
}
