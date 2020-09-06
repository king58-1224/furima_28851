FactoryBot.define do
  factory :user do
    nickname { '権左衛門' }
    email { Faker::Internet.email }
    password { 'password0' }
    encrypted_password { 'password0' }
    first_name { '渋沢' }
    family_name { '栄一' }
    first_name_kana { 'シブサワ' }
    family_name_kana { 'エイイチ' }
    birthday { '1900-01-01' }
  end
end
