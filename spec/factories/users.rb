FactoryBot.define do
  factory :user do
    nickname {'test'}
    email { Faker::Internet.email }
    password { 'test123' } 
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end