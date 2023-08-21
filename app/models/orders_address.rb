class OrdersAddress
  include ActiveModel::Model
  attr_accessor :postcode, :region_id, :municipalities. :address, :building ,:telephone_number, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 11}
    validates :order_id
    validates :user_id
    validates :item_id 
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode,region_id: region_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end