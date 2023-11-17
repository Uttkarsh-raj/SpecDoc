package main

import (
	"log"

	"github.com/Uttkarsh-raj/carejar_task/routes"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.New()
	router.Use(gin.Logger())
	routes.Routes(router)
	log.Fatal(router.Run(":8000"))
}
