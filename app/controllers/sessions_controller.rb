class SessionsController < ApplicationController
	def new
		
	end
	def create
		
		user = User.find_by(email: params[:session][:email].downcase)
		if(user && user.authenticate(params[:session][:password]))
			sign_in user
			#登入後會跳轉到登入前頁面，利用session[:return_to]是否有值實現
			redirect_back_or user
		else
			flash.now[:error] = 'invalid email/password combination'
			render 'new'
		end
	end
	def destroy
		sign_out
		redirect_to root_path
	end
end
