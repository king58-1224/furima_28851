class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_from
  has_one_attached       :image
  belongs_to :user

  # ①　imageを送るアクティブストレージとのアソシエーション　参考カリキュラム
  # ②　ユーザーとのアソシエーション　README
end
