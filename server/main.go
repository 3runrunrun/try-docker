package server

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Serve gin.Engine instance
func Serve() *gin.Engine {
	ginengine := gin.Default()

	// api route group
	sandbox := ginengine.Group("/api/sandbox")
	{
		sandbox.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, gin.H{"code": http.StatusOK, "status": true, "message": "connected"})
		})
	}

	return ginengine
}
