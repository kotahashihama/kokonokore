class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :food_id, presence: true
end
