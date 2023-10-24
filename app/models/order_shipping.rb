class OrderShipping
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code,:area_id,:city,:street_address,:building_name,:phone_number,:order_id,:token
  
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :city
      validates :street_address
     
      validates :token
    end

    validates :post_code, presence: { message: "can't be blank" }, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :phone_number,presence: { message: "can't be blank" }, format: {with: /\A\d{10,11}\z/,message:"is invalid. Input only number"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      if order.persisted?
        Shipping.create(
          post_code: post_code,
          area_id: area_id,
          city: city,
          street_address: street_address,
          building_name: building_name,
          phone_number: phone_number,
          order_id: order.id
        )
      else
        errors.add(:base, 'Failed to save order and shipping information')
        false
      end
    end
  end