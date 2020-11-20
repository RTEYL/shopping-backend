class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password,
   :presence => true,
   :confirmation => true,
   :length => {:within => 6..15}

end
