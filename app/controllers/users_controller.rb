class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
      redirect_to :back
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render 'new'
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
