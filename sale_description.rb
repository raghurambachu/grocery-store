class SaleDescription
    attr_reader :prod_name,:sale_qty,:sale_price
    def initialize(prod_name,sale_qty,sale_price)
        @prod_name = prod_name
        @sale_qty = sale_qty
        @sale_price = sale_price
    end
    def sale_details
        [@prod_name,@sale_qty,@sale_price]
    end
end