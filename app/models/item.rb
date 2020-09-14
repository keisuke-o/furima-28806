class Item < ApplicationRecord
  validates :name, presence: true
  validates :descrive, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping, presence: true
  validates :prefecture, presence: true
  validates :delivery_day, presence: true
  validates :price, presence: true, :numericality => {:greater_than_or_equal_to => 300 }, :numericality => { :less_than_or_equal_to => 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :descrive, presence: true

  belongs_to :user
  has_one_attached :image

end
