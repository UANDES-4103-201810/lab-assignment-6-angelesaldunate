class RegistrationsController < ApplicationController
	def new
	
	end

	def create

		@user = User.new(user_params)
		if @user.save
			session[:current_user_id] = @user.id
			flash[:notice] = "You have successfully registered."
			redirect_to root_url
		else
			flash[:notice] = "You have an error during registration."
			redirect_to registrations_url
		end
		#complete this method
	end

	def user_params
		params.require(:registrations).permit(:name, :last_name, :phone, :email, :password)
	end
end
