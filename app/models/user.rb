class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :party, :email, :password, :password_confirmation, :admin
  validates_presence_of :password, :on => :create
  
  def admin?
    self.admin == true
  end
  
end
