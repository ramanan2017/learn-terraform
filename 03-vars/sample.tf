variable "fruit_name" {
  default= "apple"
}

# print variable
output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits"{
  default = [
    "apple",
    "banana"
  ]
  // default = [ "apple" , "banana" ]  // Single line syntex
}

# Map Variable, Plain
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 200
  }
}

# Map Variable, Map of Maps
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 400
      price = 1
    }
  }
}

## Access a list variable, List index starts from zero
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

## Access a map variable
output "fruit_stock_apple" {
  value = var.fruit_stock["apple"]
}
output "fruit_stock_with_price_of_apple" {
  value = var.fruit_stock_with_price["apple"].stock
}

#variable Data Types
variable "fruit_details" {
  default = {
    apple = {
      stock = 100
      type = "washington" # string
      for_sale = true     # boolean

    }
  }
}
# variable in a combination of an other string then it needs to be with in ${}
output "fruit_details_apple"{
  value = "Apple Stock = ${var.fruit_details["apple"].stock}, Apple Type = ${var.fruit_details["apple"].type}"
}