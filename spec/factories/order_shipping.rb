FactoryBot.define do
  factory :order_shipping do
    post_code {"000-0000"}
    area_id {"2"}
    city {"札幌市"}
    street_address {"1-1"}   
    building_name{"○○マンション"}
    phone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
