class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/}
  end
  validates :image, :name, :description, :category_id, :condition_id, :carriage_payer_id, :prefecture_id, :handling_time_id, presence: true 

  validates :price, inclusion: {in: 300..9999999}

  validates :category_id, :condition_id, :carriage_payer_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :carriage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time
end
