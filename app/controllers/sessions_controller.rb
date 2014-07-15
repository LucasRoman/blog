class SessionsController < ApplicationController

  def new
  	#session[:user_id] = @user.id
  end

  def create
  	if @user = User.authenticate(params[:user])
    session[:user_id] = @user.id
    redirect_to root_url
	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end

end
