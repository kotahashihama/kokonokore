class Food < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :shop_name, presence: true
  validates :description, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
  validates :picture, presence: true
end
