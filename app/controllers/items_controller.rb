class ItemsController < ApplicationController
	def new
		@item = Item.new
		@categories = Category.all
	end
	def create
		@item = Item.new (items_params)
  		if @item.save
  			redirect_to items_path, notice: 'Item created sucessful'
  		else
  			redirect_to new_item_path, alert: 'Error creating item'
  		end
	end

	def edit
  		@item = Item.find(params[:id])
  	end

  	def update
  		@item = Item.find(params[:id])
  		if @item.update(items_params)
  			redirect_to items_path, notice: 'Item created successful'
  		else
  			redirect_to edit_item_path(@item.id), alert: 'Error creating item'
  		end
  	end

  	def destroy
  		@item = Item.find(params[:id])
  		@item.destroy
  		redirect_to items_path, notice: 'Item destroyed successful'
  	end



	def index
		@items = Item.all
	end

	private
  		def items_params
  			params.require(:item).permit(:name, :description, :price)
  		end
end