require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品情報登録' do
      context '新規登録できる場合' do
      it "全ての条件を入力すると登録ができる" do
      expect(@item).to be_valid
     end
    end
  end

    context '商品情報登録できない場合' do
      it '画像が空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    
      it "商品名がなければ登録できない" do
        @item.name =''
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end
  
       it "商品の説明がなければ登録できない" do
         @item. explanation =''
         @item.valid?
         expect(@item.errors[:explanation]).to include("can't be blank")
       end

       it "カテゴリーがなければ登録できない" do
         @item.category_id=nil
         @item.valid?
         expect(@item.errors[:category_id]).to include("can't be blank")
       end

       it "カテゴリーの「---」が選択されている状態では保存ができない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

       it "商品の状態がなければ登録できない" do
         @item.condition_id= nil
         @item.valid?
         expect(@item.errors[:condition_id]).to include("can't be blank")
       end

       it "商品の状態の「---」が選択されている状態では保存ができない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

       it "配送料の負担がなければ登録できない" do
          @item.fee_burden_id= nil
          @item.valid?
          expect(@item.errors[:fee_burden_id]).to include("can't be blank")
        end

        it "配送料の負担の「---」が選択されている状態では保存ができない" do
          @item.fee_burden_id = 1
          @item.valid?
          expect(@item.errors[:fee_burden_id]).to include("can't be blank")
        end

        it "発送元の地域がなければ登録できない" do
          @item.area_id= nil
          @item.valid?
          expect(@item.errors[:area_id]).to include("can't be blank")
         end

         it "発送元の地域の「---」が選択されている状態では保存ができない" do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors[:area_id]).to include("can't be blank")
        end

         it "発送までの日数がなければ登録できない" do
            @item.handling_time_id= nil
            @item.valid?
            expect(@item.errors[:handling_time_id]).to include("can't be blank")
           end

           it "発送までの日数の「---」が選択されている状態では保存ができない" do
            @item.handling_time_id = 1
            @item.valid?
            expect(@item.errors[:handling_time_id]).to include("can't be blank")
          end

         it "価格がなければ登録できない" do
           @item.price= nil
           @item.valid?
           expect(@item.errors[:price]).to include("Price is invalid. Input half-width characters")
          end

          it "価格は半角数値でなければ登録できない" do
            @item.price = "aaaa"
            @item.valid?
            expect(@item.errors[:price]).to include("Price is invalid. Input half-width characters")
          end
          
            it '価格が範囲外だと登録できない' do
              @item.price = "9999999999"
              @item.valid?
              expect(@item.errors[:price]).to include("Price is out of setting range")
            end
      
            it '価格が300未満だと登録できない' do
              @item.price = "299"
              @item.valid?
              expect(@item.errors[:price]).to include("Price is out of setting range")
            end

              it 'userが紐付いていないと保存できない' do
                @item.user = nil
                @item.valid?
                expect(@item.errors.full_messages).to include('User must exist')
            end
          end
        end
      end
