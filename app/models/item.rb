class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :description_item, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id, presence: true ,numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true,format: {with: /\A[0-9]+\z/ },numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_name, presence: true

  belongs_to :user
  has_one_attached :item_image

end
