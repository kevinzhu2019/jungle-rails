class User < ActiveRecord::Base
  has_secure_password
  # validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, :length => {:minimum => 6 }
  
end
