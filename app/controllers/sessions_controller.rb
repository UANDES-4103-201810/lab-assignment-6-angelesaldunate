class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(id: session[:current_user_id])
		if @user.email == params[:session][:email] && @user.password == params[:session][:password]
			flash[:notice]="You have successfully logged in "
			redirect_to user_path(@user.id)
		else
			flash[:notice]="You have an error while logging in "
			redirect_to root_url
		end

	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		redirect_to root_url

	end
end
