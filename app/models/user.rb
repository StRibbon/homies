class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :connections, dependent: :destroy
  has_many :spheres, through: :connections
end
