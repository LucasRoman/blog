class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
  before_create :encrypt

  attr_accessor :password, :password_confirmation

  def encrypt
    passwors_hash = Digest::MD5.digest(password)
  end

  def self.authenticate_user(:user_id)
    User.find(:user_id)
    if user
      session[:user_id] = user.id
      sign_in user
      redirect_to user
    else
      flash[:notice] = 'User not found.'
      redirect_to 'new'
    end
  end

end
