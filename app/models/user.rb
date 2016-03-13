class User < ActiveRecord::Base
  has_many :votes
  has_many :petitions

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
