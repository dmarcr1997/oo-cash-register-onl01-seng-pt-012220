
class CashRegister
  
  attr_accessor :total, :discount
  attr_accessor :items, :last_transaction
  
  def initialize(discount = 0)
    if discount == nil
      @discount = 0
    else
      @discount = discount
    end
    @total = 0
    @items = []
    @last_transaction = []
  end
  
  def apply_discount
    if @discount == 0
      puts "There is no discount to apply."
    else
      real_discount = @discount.to_f * (10**-2)
      applied_dis = @total.to_f * real_discount
      @total.to_f
      @total -= applied_dis
      puts "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items
    @items
  end
  
  def add_item(title, price, quantity = 1)
    runn_count = 0
    @last_transaction = [title, (price*quantity), quantity]
    @total += (price*quantity)
    if quantity > 1
      while runn_count < quantity
        @items << title
        runn_count +=1
      end
    else
      @items << title
    end
  end
  
  def void_last_transaction
    run_count = 0
    @total -= @last_transaction[1] #price  
    while run_count < @last_transaction[2] #quantity
      @items.delete(@last_transaction[0]) #item
      run_count +=1 
    end
  end
end

John = CashRegister.new(20)
puts John.discount
John.add_item("fruit", 20, 4)
puts John.items
puts John.total
puts John.apply_discount


Jake = CashRegister.new(nil)
puts Jake.discount
Jake.add_item("fruit", 20, 4)
puts Jake.items
puts Jake.total
puts Jake.apply_discount
Jake.void_last_transaction
