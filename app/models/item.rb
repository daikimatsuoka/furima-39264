class Item < ApplicationRecord
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description_item, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true,format: {with: /\A[0-9]+\z/ },numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_charges
  belongs_to :region
  belongs_to :number_of_day


  belongs_to :user
  has_one_attached :item_image

end
