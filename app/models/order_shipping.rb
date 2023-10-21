class OrderShipping
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code,:area_id,:city,:street_address,:building_name,:phone_number,:order_id
  
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :post_code,format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message:"Postal code is invalid. Enter it as follows (e.g. 123-4567)"}
      validates :city
      validates :street_address
      validates :phone_number,format: {with: /\A\d{10,11}\z/,message:"Phone number is invalid. Input only number"}
    end

    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

    def save(user_id, item_id)
       order= Order.create(user_id: user_id, item_id: item_id)
       if order.persisted?
      Shipping.create(
        post_code: post_code,
        area_id: area_id,
        city: city,
        building_name: building_name,
        street_address: street_address,
        phone_number: phone_number,
        order_id: order.id
        )
      end
      errors.add(:base, 'Failed to save order and shipping information')
      false
    end
  end