class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :region_id, :municipalities, :address, :building, :telephone_number, :order_id, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]+\z/ },
                                 length: { minimum: 10, maximum: 11, message: 'Telephone number must be less than or equal to 11' }
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region_id: region_id, municipalities: municipalities, address: address,
                   building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
