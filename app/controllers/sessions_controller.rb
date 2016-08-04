class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_nickname(params[:nickname])
		if user && user.authenticate(params[:password])
      		session[:user_id] = user.id
      		redirect_to root_path
      	else
      		redirect_to login_path, alert: "Neither your Nickname nor password is incorrect"
      	end
	end

	def destroy
		session[:user_id] = nil
    	redirect_to root_path
	end
end
