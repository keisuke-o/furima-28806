class ItemOrder

  include ActiveModel::Model
  attr_accessor :prefecture_id, :city, :adress, :zip_code, :telephone, :token, :building, :item_id, :user_id

  validates :prefecture_id, numericality: {other_than: 1 }
  validates :city,       presence: true
  validates :adress,     presence: true
  validates :zip_code,   presence: true, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
  validates :telephone,  presence: true, format: {with: /\A\d{10,11}\z/}
  validates :token, presence: true
  attr_accessor :token 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Adress.create(prefecture_id: prefecture_id, city: city, adress: adress, zip_code: zip_code, telephone: telephone, order_id: order.id, building: building)
    
  end

end


# adress oreder