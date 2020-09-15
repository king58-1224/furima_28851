require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    it '商品購入ができる' do
      expect(@order).to be_valid
    end
    it 'クレジットカード情報が必須であること' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が必須であること' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンが必要であること' do
      @order.postal_code = '1231234'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end
    it '都道府県が必須であること' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県の情報が1を選択した場合登録できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市町村が必須であること' do
      @order.muncipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Muncipality can't be blank")
    end
    it '番地が必須であること' do
      @order.block_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block number can't be blank")
    end
    it '電話番号が必須であること' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @order.phone_number = '090123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is the wrong length (should be 11 characters)')
    end
    it '電話番号は11桁以内では登録できない' do
      @order.phone_number = '090'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is the wrong length (should be 11 characters)')
    end
  end
end
