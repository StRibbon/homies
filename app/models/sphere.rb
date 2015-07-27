class Sphere < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user  

  has_many :connections, dependent: :destroy
  has_many :users, through: :connections
end
