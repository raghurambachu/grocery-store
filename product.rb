class Product 
    attr_reader :prod_name,:unit_price,:sale_desc
    def initialize(prod_name,unit_price,sale_desc)
        @prod_name = prod_name
        @unit_price = unit_price
        @sale_desc = sale_desc
    end
    
    def is_in_sale?
        !sale_desc.nil?
    end


end



if __FILE__ == $0
    require_relative("sale_description")

    # Items on sale
    # Milk, Bread
    sale_milk = SaleDescription.new("milk",2,5)
    sale_bread = SaleDescription.new("bread",3,6)

    # products customer can purchase

    product1 = Product.new("milk",3.97,sale_milk.sale_details)
    product2 = Product.new("bread",2.17,sale_bread.sale_details)
    product3 = Product.new("banana",0.99,nil)
    product4 = Product.new("apple",0.89,nil)

end