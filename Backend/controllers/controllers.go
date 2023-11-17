package controllers

import (
	"context"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

var list = []map[string]string{{"category": "General Medicine", "description": "Comprehensive care for common health issues."},
	{"category": "Pediatrics", "description": "Specialized care for infants, children, and adolescents."},
	{"category": "Dermatology", "description": "Treatment of skin-related conditions and disorders."},
	{"category": "Cardiology", "description": "Focus on heart health and cardiovascular diseases."},
	{"category": "Orthopedics", "description": "Dealing with musculoskeletal system issues and injuries."},
	{"category": "Gynecology", "description": "Women\"s reproductive health and wellness."},
	{"category": "Ophthalmology", "description": "Eye care and treatment of visual disorders."},
	{"category": "ENT (Ear, Nose, and Throat)", "description": "Specialized care for ear, nose, and throat issues."},
	{"category": "Neurology", "description": "Diagnosis and treatment of neurological disorders."},
	{"category": "Psychiatry", "description": "Mental health diagnosis and treatment."},
}

func GetCategories() gin.HandlerFunc {
	return func(c *gin.Context) {
		_, cancel := context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()
		response := gin.H{
			"success": true,
			"data":    list,
		}
		c.JSON(http.StatusOK, response)
	}
}

func SearchCategory() gin.HandlerFunc {
	return func(c *gin.Context) {
		var reqBody map[string]interface{}
		if err := c.ShouldBindJSON(&reqBody); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error(), "success": false})
			return
		}
		searchString, ok := reqBody["search"].(string)
		log.Println(searchString)
		if !ok {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid or missing 'search' in the request body", "success": false})
			return
		}
		var res []map[string]string
		for i := 0; i < len(list); i++ {
			if strings.Contains(strings.ToLower(list[i]["category"]), strings.ToLower(searchString)) || strings.Contains(strings.ToLower(list[i]["description"]), strings.ToLower(searchString)) {
				res = append(res, list[i])
			}
		}
		response := gin.H{
			"success": true,
			"data":    res,
		}
		c.JSON(http.StatusOK, response)
	}
}
