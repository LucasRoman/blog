class SessionsController < ApplicationController

  def new
  end

  def create
    User.authenticate_user(params[:user_id])
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to 'new'
  end

end
