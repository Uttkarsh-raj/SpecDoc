package routes

import (
	"github.com/Uttkarsh-raj/carejar_task/controllers"
	"github.com/gin-gonic/gin"
)

func Routes(incomingRoutes *gin.Engine) {
	incomingRoutes.GET("/categories", controllers.GetCategories())
	incomingRoutes.GET("/search", controllers.SearchCategory())
}
