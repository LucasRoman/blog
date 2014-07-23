class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation
  
  before_create :encrypt
  
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  scope :params, -> { find params[:id]  }

  def self.authenticate_user email, password
    find_by email: email, password_hash: Digest::MD5.digest(password).force_encoding('utf-8') 
  end

  def encrypt
    self.password_hash = Digest::MD5.digest(password).force_encoding('utf-8')
  end

end
