class UsersController < ApplicationController
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

	private

	def user_params  
		params.require(:user).permit(:full_name, :nickname, :email, :password, :password_confirmation)
	end
end
