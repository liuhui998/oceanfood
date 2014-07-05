class Food < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 100}
  validates :image, presence: true
  
  mount_uploader :image, FoodImageUploader
end
