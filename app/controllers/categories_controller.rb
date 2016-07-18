class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end
  def create
  	@category = Category.new categories_params
  	if @category.save
  		redirect_to categories_path, notice: 'Category created sucessful'
  	else
  		redirect_to new_category_path, alert: 'Error creating category'
  	end
  end

  def show
    
  end

  def index
  	@categories = Category.all
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(categories_params)
  		redirect_to categories_path, notice: 'Category created successful'
  	else
  		redirect_to edit_category_path(@category.id), alert: 'Error creating category'
  	end
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.destroy
  	redirect_to categories_path, notice: 'Category destroyed successful'
  end

  private
  	def categories_params
  		params.require(:category).permit(:name)
  	end
end
