package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("listening for requests...")
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8090", nil)
}

func hello(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "big dick energy\n")
}
