class Cart < ActiveRecord::Base
	has_many :items_inside, class_name: 'ItemInsideCart'


	def empty?
    	items_inside.empty?
  	end

  	def add_item(item_id)
    	item_inside_cart = items_inside.where('item_id = ?', item_id).first
    	if item_inside_cart.nil?
    		new_item = ItemInsideCart.new(item: Item.find(item_id))
    		new_item.quantity = 1
    		items_inside << new_item
    	else
      		item_inside_cart.update(quantity: item_inside_cart.quantity + 1)
    	end
    	save
  	end


  	def remove_item(item_id)
    	item_inside_cart = items_inside.where('item_id = ?', item_id).first
    	if item_inside_cart.quantity == 1
    		items_inside.delete item_inside_cart
    		item_inside_cart.destroy
    	else
      		item_inside_cart.update(quantity: item_inside_cart.quantity - 1)
    	end
    	save
  	end

  	def remove_all_item(item_id)
  		item_inside_cart = items_inside.where('item_id = ?', item_id).first
  		items_inside.delete item_inside_cart
  		item_inside_cart.destroy
  	end

  	def total_price
    	sum = 0
    	items_inside.each { |i| sum += i.sub_total }
    	sum
  	end
end
