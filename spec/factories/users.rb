FactoryBot.define do
  factory :user do
    nickname {'test'}
    email { Faker::Internet.email }
    password { 'test123' } 
    password_confirmation { 'test123' } 
    family_name { 'ヤマダ' }
    first_name { 'ヤマダ' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end