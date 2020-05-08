
class CashRegister

  attr_accessor :discount, :total, :last_transaction_amount, :items 

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, price, amount=1)
    if amount > 1 
      i = 0 
      while i < amount
        @items << item
        i+=1
      end 
    else
      @items << item
    end
    @total += price*amount
    @last_transaction_amount = price*amount 
    @total 
  end

  def apply_discount
    if discount > 0
      @discount = @discount/100.to_f 
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction()
    self.total = self.total - self.last_transaction_amount
  end
  
end

