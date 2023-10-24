require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_shipping = FactoryBot.build(:order_shipping,item_id: item.id,user_id: user.id)
    end


    context '配送先情報の保存が出来るとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_shipping.building_name=''
        expect(@order_shipping).to be_valid
      end
    end

    context '配送先情報の保存が出来ないとき' do
      it '郵便番号が空では保存できない。' do
          @order_shipping.post_code = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角数字でないと保存できない' do
        @order_shipping.post_code='123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が空では保存できない' do
        @order_shipping.area_id=nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Area can't be blank")
      end

      it "都道府の「---」が選択されている状態では保存ができない" do
        @order_shipping.area_id = 1
        @order_shipping.valid?
        expect( @order_shipping.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空では保存できない' do
        @order_shipping.city=''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @order_shipping.street_address=''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @order_shipping.phone_number=''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は、10桁以下の半角数値だと保存できない' do
        @order_shipping.phone_number='123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号は、11桁以上の半角数値ではないと保存できない' do
        @order_shipping.phone_number='1234567890123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号に半角数字以外が含まれている場合は保存できない' do
        @order_shipping.phone_number='12345678abc'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'userが紐付いていなければ保存できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect( @order_shipping.errors.full_messages).to include("User can't be blank")
      end


      it 'itemが紐付いていなければ保存できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できない" do
        @order_shipping.token =''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end