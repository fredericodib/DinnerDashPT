class OrdersController < ApplicationController
	before_action :authorize, only: [:add_order]
	before_action :authorize_admin, only: [:index]

	def add_order
  		@order = Order.new
  		@order.user = current_user
  		@order.cart = current_cart
  		@order.save
  		session[:cart_id] = nil
  		redirect_to items_path, notice: 'Order sended successsful'
	end

	def show
		@user = User.find(params[:id])
		@orders = @user.order
	end

	def show_history
		@user = User.find(params[:id])
		@orders = @user.order
	end

	def cancel_order
		@order = Order.find(params[:id])
		@order.update_attribute :order_status_id, 4
		redirect_to my_order_path(@order.user.id)
	end

	def index
		@users = User.all
		@order_status = OrderStatus.all
	end

	def change_status
		@order = Order.find(params[:id])
		@order.update_attribute :order_status_id, params[:value]
	end
end
