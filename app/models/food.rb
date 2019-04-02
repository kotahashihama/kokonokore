class Food < ApplicationRecord
  validates :name, presence: true
  validates :shop_name, presence: true
  validates :description, presence: true
end
