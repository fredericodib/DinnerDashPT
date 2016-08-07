class UsersController < ApplicationController
	before_action :authorize_admin, only: [:destroy, :index]
	before_action :authorize, only: [:show]

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to root_path, notice: 'Account successfully created'
		else
			redirect_to sign_up_path, alert: 'Error creating your account!'
		end
	end

	def index
		@users = User.all
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, notice: 'User destroyed successful'
	end

	def change_admin
		@user = User.find(params[:id])
		if @user.admin
			@user.update_attribute :admin, false
		else
			@user.update_attribute :admin, true
		end
		redirect_to users_path, notice: 'User admin changed successful'
	end

	def show
		@user = @current_user
	end

	private

	def user_params  
		params.require(:user).permit(:full_name, :nickname, :email, :password, :password_confirmation)
	end
end
