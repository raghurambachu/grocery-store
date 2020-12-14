class OrderDetails
    attr_reader :item_name,:qty,:order_amount,:unit_price
    def initialize(item_name,qty,unit_price,order_amount)
        @item_name = item_name
        @qty = qty
        @unit_price = unit_price
        @order_amount = order_amount
    end

    def self.display_orders(order_list)
        puts
        puts "Item Name          Quantity           Price"
        puts "-------------------------------------------------"

        # Display the user the total amount and actual amount(if sale not there).
        order_total = 0
        actual_amount = 0

        order_list = order_list.sort { |order1,order2|  order1.qty != order2.qty ? 0 : order1.item_name <=> order2.item_name}
        order_list.each do |order|
            order_total += order.order_amount
            actual_amount += order.unit_price * order.qty
            print "#{order.item_name.ljust(22," ")}" 
            print "#{order.qty.to_s.ljust(18," ")}"
            print "\$#{order.order_amount}"
            puts
        end

        puts
        puts "Total price : \$#{order_total}"
        puts "You saved \$#{(actual_amount - order_total).round(2)} today."
    end

    # Builds orderList and calculates order sum/total for each item
    # It returns an array of 2 items order_list, and invalid_products
    def self.build_order(store,order)
        # Is  collection of OrderDetails instance. 
        order_list = []
        invalid_products = []
        order.each do |key,value|
            ord_item = store.products[key]
            # Only if item exists in price table
            if !ord_item.nil?
                # qty denotes user inputted quantity, that is number of times user has inputted a item in string
                qty = value
                if ord_item.is_in_sale?
                    name,sale_qty,sale_price = ord_item.sale_desc

                    # Extras are those extra on which unit price is applicable
                    extras = qty % sale_qty
                    # Number on which sale price is applicable
                    no_which_sale_price_appl = qty / sale_qty
                    order_amount = extras * ord_item.unit_price + no_which_sale_price_appl * sale_price
                    order_list << self.new(key,qty,ord_item.unit_price,order_amount)
                else
                    order_amount = qty * ord_item.unit_price
                    order_list << self.new(key,qty,ord_item.unit_price,order_amount)
                end
            else
                invalid_products << key 
            end
        end
        return [order_list,invalid_products]
    end
end