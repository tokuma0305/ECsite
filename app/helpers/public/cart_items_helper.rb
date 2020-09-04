module Public::CartItemsHelper
    def addTax(money,rate)
        taxed_money =  (money*rate).round
        "税込#{taxed_money}円"
    end
    def subtotal(money,rate,number)
        total = (money*rate*number).round
        "#{total}"
    end
end
