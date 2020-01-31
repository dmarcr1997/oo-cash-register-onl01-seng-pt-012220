require 'pry'
class CashRegister
  
  attr_accessor :total, :discount
  attr_reader :last_transaction, :items
  
  def initialize(discount = 0)
    @discount = discount
    @items = []
    @last_transaction = {}
    @total = 0
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
  binding.pry
  def apply_discount
    applied = 0
    if @discount != 0 
      @discount.to_f
      @discount = @discount * 10**-2
      applied =  @total * @discount
      @total -= applied
      puts "After the discount, the total comes to $#{@total}."
    else
      puts "There is no discount to apply."
    end
  end
  
  binding.pry
  
  
  def void_last_transaction
    run_count = 0
    @total -=last_transaction[1]  
    while count < last_transaction[2]
      @items.delete(last_transaction[0])
      run_count +=1 
    end
  end
  
end
