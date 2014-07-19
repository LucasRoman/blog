class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_user(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Sign in!'
    else
      flash[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => 'Sign out!'
  end

end
