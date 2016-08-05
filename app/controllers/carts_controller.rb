class CartsController < ApplicationController
	def show
		@cart = current_cart
	end

	def add_to_cart
		current_cart.add_item(params[:item_id])
		redirect_to current_cart_path
	end

	def remove_from_cart
		current_cart.remove_item(params[:item_id])
		redirect_to current_cart_path
	end

	def remove_all_from_cart
		current_cart.remove_all_item(params[:item_id])
		redirect_to current_cart_path
	end
end
