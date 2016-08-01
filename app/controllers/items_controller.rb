class ItemsController < ApplicationController
	def new
		@item = Item.new
		@categories = Category.all
	end
	def create
		@item = Item.new (items_params)
		@item.item_photo = item_photo_param
		
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
  		@item.item_photo = item_photo_param

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

  	def categories
  		if params[:value].nil?
    		@items = Item.all
    	else
    		@category = Category.find(params[:value])
    		@items = @category.items
    	end
    	respond_to do |format|
    		format.js { render :items }
    		format.json { render :items }
    	end
  	end


	def index
		@items = Item.all
		@categories = Category.all
	end

	private
  		def items_params
  			params.require(:item).permit(:name, :description, :price, category_ids: [])
  		end

  		def item_photo_param
  			params.require(:item).fetch(:item_photo, {})
  		end
end
