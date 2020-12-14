require_relative("sale_description")
require_relative("product")
require_relative("grocery_store")
require_relative("order_details")

grocery_store = GroceryStore.new("Apna Bazaar")

# Items on sale
# Milk, Bread
sale_milk = SaleDescription.new("milk",2,5)
sale_bread = SaleDescription.new("bread",3,6)

# products customer can purchase

product1 = Product.new("milk",3.97,sale_milk.sale_details)
product2 = Product.new("bread",2.17,sale_bread.sale_details)
product3 = Product.new("banana",0.99,nil)
product4 = Product.new("apple",0.89,nil)

grocery_store.add_product(product1)
grocery_store.add_product(product2)
grocery_store.add_product(product3)
grocery_store.add_product(product4)



GroceryStore.print_pricetable(grocery_store)

puts 
puts "Please enter all the items purchased separated by a comma"
order_str = gets.chomp

orders_item_names = order_str.downcase.strip.split(",").map(&:strip).reject { |item|  item == "" }

# Order is an Hash containing order details ie order_item => count
order = orders_item_names.reduce(Hash.new(0)) { |order,item| order[item] = (order[item] || 0) + 1; order }

order_list,invalid_products =  OrderDetails.build_order(grocery_store,order)

OrderDetails.display_orders(order_list)

puts
print "Invalid products #{ invalid_products.join(", ")}" 

