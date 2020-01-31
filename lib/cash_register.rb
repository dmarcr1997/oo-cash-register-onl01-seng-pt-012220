require 'pry'
class CashRegister
  
  attr_accessor :total, :discount
  attr_reader :total, :last_transaction
  
  def initialize(discount = 0)
    @discount = discount
    @items = []
    @last_transaction = {}
    @total = 0
  end
  
  binding.pry
  def add_item(title, price, quantity = 1)
    count = 0
    @total += price*quantity
    if quantity > 1
      while count < quantity
        @items << title
        count +=1
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
      applied =  @total * @discount
      @total -= applied
      puts "After the discount, the total comes to $#{@total}."
    else
      puts "There is no discount to apply."
    end
  end
  
  binding.pry
  def items
    @items
  end
  
  def void_last_transaction
    count = 0
    @total -=last_transaction[1]  
    while count < last_transaction[2]
      @items.delete(last_transaction[0])
      count +=1 
    end
  end
  
end
