module Public::OrdersHelper
    def addTax(money,rate)
        taxed_money =  (money*rate).round
        "¥#{taxed_money}"
    end
    def subtotal(money,rate,number)
        total = (money*rate*number).round
        "#{total}"
    end
end
