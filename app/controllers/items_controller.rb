class ItemsController < ApplicationController
	def new
		@item = Item.new
	end
	def create
		@item = Item.new (items_params)
  		if @item.save
  			redirect_to items_path, notice: 'Item created sucessful'
  		else
  			redirect_to new_item_path, alert: 'Error creating item'
  		end
	end
	def index
		@items = Item.all
	end

	private
  		def items_params
  			params.require(:item).permit(:name, :description, :price)
  		end
end
