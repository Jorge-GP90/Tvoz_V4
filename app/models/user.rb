class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :tasks


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
