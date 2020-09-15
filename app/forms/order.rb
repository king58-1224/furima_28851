class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :muncipality, :block_number, :apartment_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :muncipality
    validates :block_number
    validates :phone_number, { length: { is: 11 } }
    validates :token
  end

  def save
    Address.create(item_id: item_id, postal_code: postal_code, prefecture_id: prefecture_id, muncipality: muncipality, block_number: block_number, apartment_name: apartment_name, phone_number: phone_number)
    ItemPurchase.create(item_id: item_id, user_id: user_id)
  end
end
