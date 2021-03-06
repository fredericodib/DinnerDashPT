class ItemsController < ApplicationController
  before_action :authorize_admin, only: [:destroy, :new, :edit]
  
	def new
		@item = Item.new
		@categories = Category.all
	end
	def create
		@item = Item.new (items_params)
		@item.item_photo = item_photo_param
		@item.active = true
  		if @item.save
  			redirect_to items_path, notice: 'Item created sucessful'
  		else
  			redirect_to new_item_path, alert: 'Error creating item'
  		end
	end

	def edit
  		@item = Item.find(params[:id])
      @categories = Category.all
  	end

  	def update
  		@item = Item.find(params[:id])
  		@item.item_photo = item_photo_param

  		if @item.update(items_params)
  			redirect_to items_path, notice: 'Item edited successful'
  		else
  			redirect_to edit_item_path(@item.id), alert: 'Error editing item'
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

  def active_change
    @item = Item.find(params[:id])
    if @item.active
      @item.update_attribute :active, false
    else
      @item.update_attribute :active, true
    end
    redirect_to root_path, notice: 'Active item chenged'
  end

	private
  		def items_params
  			params.require(:item).permit(:name, :description, :price, category_ids: [])
  		end

  		def item_photo_param
  			params.require(:item).fetch(:item_photo, {})
  		end
end
