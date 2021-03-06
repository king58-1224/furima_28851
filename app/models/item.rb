class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_from
  has_one_attached       :image
  belongs_to :user
  has_one    :item_purchase
  has_one    :address

  # ①　imageを送るアクティブストレージとのアソシエーション　参考カリキュラム
  # ②　ユーザーとのアソシエーション　README
  validates :name, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image, :category, :condition_id, :shipping_cost_id, :shipping_days_id, :shipping_from_id, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, inclusion: { in: 300..9_999_999, message: 'is out of range' }

  with_options presence: true do
    validates :category_id, :condition_id, :shipping_cost_id, :shipping_days_id, :shipping_from_id, numericality: { other_than: 1, message: 'must be other than' }
  end
end
