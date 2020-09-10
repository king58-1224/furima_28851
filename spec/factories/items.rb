FactoryBot.define do
  factory :item do
    name { '商品名' }
    price { 10_000 }
    description { '商品の説明' }
    condition_id { 2 }
    shipping_cost_id { 2 }
    shipping_days_id { 2 }
    shipping_from_id { 2 }
    category_id { 2 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
