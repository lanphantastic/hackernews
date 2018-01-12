class Item < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :title, presence: true, length: { maximum: 250 }, allow_blank: false
  validates :id, uniqueness: true
end
