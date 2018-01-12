class User < ApplicationRecord
  # associations
  has_many :items

  # validations
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password, presence: true, on: :create
end
