FactoryBot.define do
  factory :order do
    token { '1234567' }
    postal_code { '123-1234' }
    muncipality { '西宮市' }
    prefecture_id { '2' }
    block_number { '11' }
    phone_number { '09012345678' }
  
  end
end
