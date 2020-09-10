require 'rails_helper'

RSpec.describe Item, type: :model do
  # FactoryBot.buildをして@itemをitem_spec.rbで定義をする
  # userをFactoryBot.createで定義しましょう
  # rspecでbuildとcreateの違いは何か？
  
  
  describe '商品出品機能' do
    before  do
      @user = FactoryBot.build(:user)
    
      @item = FactoryBot.build(:item)
    end
    it '全ての出品がうまくいく時' do
      expect(@item).to be_valid
    end
    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Category can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.shipping_from_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Shipping from can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Price is not a number")
    end
    it '価格が、¥300以上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of range")
    end
    it '価格が、¥10,000,000未満であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of range")
    end
    it '販売価格は半角数字のみ入力可能であること' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages). to include()
    end
  end
end