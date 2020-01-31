
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
  
  def items
    @items
  end
  
  def add_item(title, price, quantity = 1)
    runn_count = 0
    @total += price*quantity
    if quantity > 1
      while runn_count < quantity
        @items << title
        runn_count +=1
      end
    else
      @items << title
    end
    @last_transaction = [title, (price*quantity), quantity]
  end

  
  def apply_discount
    if @discount != 0 
      @discount.to_f
      @discount = @discount * 10**-2
      applied =  @total.to_f * @discount
      @total -= applied
      puts "After the discount, the total comes to $#{@total.to_f}."
    else
      puts "There is no discount to apply."
    end
  end
  
  binding.pry
  
  
  def void_last_transaction
    run_count = 0
    @total -= @last_transaction[1]  
    while run_count < @last_transaction[2]
      @items.delete(@last_transaction[0])
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
