package main

import (
	"net/http"
)

func main() {

	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		rw.Write([]byte("Welcome to my demo :)"))
	})
	http.ListenAndServe("0.0.0.0:9000", nil)
}
