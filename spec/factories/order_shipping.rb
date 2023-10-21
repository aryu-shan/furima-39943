FactoryBot.define do
  factory :order_shipping do
    item_id { 1 }
    user_id { 1 }
    post_code {"000-0000"}
    area_id {"2"}
    city {"札幌市"}
    street_address {"1-1"}   
    building_name{"○○マンション"}
    phone_number{"012-345-6789"}
  end
end
