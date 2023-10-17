FactoryBot.define do
  factory :item do
    name {"商品名です"}
    explanation {"説明文です"}
    category_id {2}
    condition_id {2}   
    price{555}
    fee_burden_id{2}
    area_id{2}
    handling_time_id{2}
    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
   end
end

