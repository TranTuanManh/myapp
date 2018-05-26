class SessionController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user.nil?
  	  flash.now[:danger] = "Email not exist"
  	  render :new
  	elsif user.authenticate(params[:session][:password])
  	  flash[:success] = "Log in successfully"
  	  log_in user
  	  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
  	else
  	  flash.now[:danger] = "Password not correct"
  	  render :new
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to session_new_path
  end
end
