class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:user_id])
   	  session[:user_id] = user.id
      sign_in user
      redirect_to user
    else
      flash[:notice] = 'User not found.'
      redirect_to 'new'
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to 'new'
  end

end
