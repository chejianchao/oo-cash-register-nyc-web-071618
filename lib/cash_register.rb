
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @price = []
  end

  def add_item(item_name, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      @items << item_name
      @price << price
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = (self.total * (1-self.discount/100.0)).to_i
      self.discount = 0
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @items.pop
    self.total -= @price.pop
  end
end
