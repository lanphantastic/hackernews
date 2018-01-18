class Item < ApplicationRecord
  # validations
  validates :username, presence: true
  validates :item_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :time, presence: true
  validates :item_type, presence: true
end
