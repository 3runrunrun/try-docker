package main

import (
	"log"

	"github.com/3runrunrun/try-docker/server"
)

func main() {
	//  egn for engine
	egn := server.Serve()
	log.Println("apps running on PORT 3682 ...")

	// run engine on PORT 3682
	err := egn.Run(":3682")
	if err != nil {
		log.Panicln("apps error ...")
	}
}
