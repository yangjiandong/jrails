#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    @items << product
  end
end

#http://forums.pragprog.com/forums/66/topics/1663
#class Cart
#  attr_reader :items
#
#  def initialize
#    @items = []
#  end
#
#  def add_product(product)
#    current_item = nil
#    @items.each do |cartItem|
#      if cartItem.product.id == product.id
#        current_item = cartItem
#        break
#      end
#    end
#    if current_item
#      current_item.increment_quantity
#    else
#      current_item = CartItem.new(product)
#      @items << current_item
#    end
#    current_item # Return the current item so the controller
#  end
#
#  def total_price
#    @items.sum { |item| item.price }
#  end
#
#  def total_items
#    @items.sum { |item| item.quantity }
#  end
#end