class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :description_item, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :region_id, presence: true
  validates :price, presence: true
  validates :item_name, presence: true

  belongs_to :user
  has_one_attached :image
end
