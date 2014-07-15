class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
  before_create :encrypt

  attr_accessor :password, :password_confirmation

  def validation_password
    errors.add(:password, 'Passwords must be equal.') unless password == password_confirmation
  end

  def encrypt
    passwors_hash = Digest::MD5.digest(password)
  end

  def self.authenticate_user(user_id)
    User.find(:user_id)
  end

end
