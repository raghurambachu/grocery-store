class GroceryStore
    attr_reader :products,:title
    def initialize(title)
        @title = title
        @products = Hash.new
    end

    def add_product(product)
        products[product.prod_name] = product if product
    end

    def self.print_pricetable(store)
        # printout the table depicting the unit price and sale price using each iterator
        puts "Welcome to #{store.title}"
        puts "Item Name          Unit price          Sale price"
        puts "-------------------------------------------------"

        store.products.each { |prod_name,product|
            unit_price = product.unit_price
            name, sale_qty, sale_price = product.sale_desc if product.is_in_sale?
            print "#{prod_name.ljust(22," ")}\$#{unit_price.to_s.ljust(16," ")}" 
            print "#{sale_qty} for \$#{sale_price}" if product.is_in_sale?
            puts
        }
    end

end