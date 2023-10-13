require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

      describe 'ユーザー新規登録' do
          context '新規登録できる場合' do
          it "nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる" do
          expect(@user).to be_valid
        end

        it 'family_nameとfirst_nameが全角であれば登録できる' do
          @user.family_name = '山田'
          @user.first_name = '太郎'
          expect(@user).to be_valid
        end

        it 'family_name_kanaとfirst_name_kanaが全角であれば登録できる' do
          @user.family_name_kana = 'ヤマダ'
          @user.first_name_kana = 'タロウ'
          expect(@user).to be_valid
        end
      end

      context '新規登録できない場合' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        # password
        it "passwordがない場合は登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが半角英数字混合でなければ登録できない' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password Password is invalid. Include both letters and numbers")
        end

        it 'passwordが6文字未満では登録できない' do
          @user.password ='test1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

          it '数字のみのpasswordでは登録できない' do
            @user.password = '123456'
            @user.password_confirmation = '123456'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
          end

          it '全角文字を含むpasswordでは登録できない' do
            @user.password = 'ＴＥＳＴ1234'
            @user.password_confirmation = 'ＴＥＳＴ1234'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
          end

          #名前
          it 'family_nameが空では登録できない' do
            @user.family_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Family name can't be blank")
          end

          it 'family_name_kanaが空では登録できない' do
            @user.family_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Family name kana can't be blank")
          end
       
          it 'first_nameが空では登録できない' do
            @user.first_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank")
          end
       
          it 'first_name_kanaが空では登録できない' do
            @user.first_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end

          it 'family_name（全角）に半角文字が含まれていると登録できない' do
            @user.family_name = 'ヤマﾀﾞ'
            @user.valid?
            expect(@user.errors.full_messages).to include("Family name Family name is invalid. Input full-width characters")
          end

          it 'first_name（全角）に半角文字が含まれていると登録できない' do
            @user.first_name = 'タロｳ'
            @user.valid?
            expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters")
          end

          it 'family_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
              @user.family_name_kana = '山田＠'
              @user.valid?
              expect(@user.errors.full_messages).to include("Family name kana Please enter in the full-width katakana")
            end
   
            it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
              @user.first_name_kana = '太郎＠'
              @user.valid?
              expect(@user.errors.full_messages).to include("First name kana Please enter in the full-width katakana")
            end

          it "生年月日が空だと登録できない" do
            @user.birth_day = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Birth day can't be blank")
          end
        end
     end
  end         

     

     
 



