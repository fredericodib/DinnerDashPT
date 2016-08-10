class UsersController < ApplicationController
	before_action :authorize_admin, only: [:destroy, :index]
	before_action :authorize, only: [:show]
	before_action :set_user, only: [:create, :destroy, :change_admin, :edit, :update]

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
		@user.destroy
		redirect_to users_path, notice: 'User destroyed successful'
	end

	def change_admin
		if @user.admin
			@user.update_attribute :admin, false
		else
			@user.update_attribute :admin, true
		end
		redirect_to users_path, notice: 'User admin changed successful'
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
		if @user.update(user_params)
  			redirect_to user_path(user.id), notice: 'User password changed successful'
  		else
  			redirect_to edit_user_path(@user.id), alert: 'Error changing password'
  		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
	def user_params  
		params.require(:user).permit(:full_name, :nickname, :email, :password, :password_confirmation)
	end
end
