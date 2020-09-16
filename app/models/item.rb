class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping

  validates :name, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping, presence: true
  validates :prefecture, presence: true
  validates :delivery_day, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :describe, presence: true
  validates :image, presence: true

end
