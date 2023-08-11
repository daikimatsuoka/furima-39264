class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :description_item, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id, presence: true ,numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true
  validates :item_name, presence: true

  belongs_to :user
  has_one_attached :image
end
