class Adress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :order

#   validates :prefecture, presence: true
#   validates :city,       presence: true
#   validates :adress,     presence: true
#   validates :zip_code,   presence: true, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
# }
#   validates :telephone,  presence: true, format: { with: /\A\d{10,11}\z/}
#   validates :token, presence: true
#   attr_accessor :token


end
