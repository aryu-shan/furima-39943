class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname,           presence: true         
   validates :password,format: { with: /\A(?=.*[a-z])(?=.*\d)(?![\p{Katakana}])\w+\z/i, 
              message: "Password is invalid. Include both letters and numbers"
               }, on: :create
   validates :family_name,        presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "Family name is invalid. Input full-width characters" }
   validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "First name is invalid. Input full-width characters" }
   validates :family_name_kana,   presence: true, format:{ with: /\A[\p{katakana}\p{blank}]+\z/, message: 'Please enter in the full-width katakana' }
   validates :first_name_kana,    presence: true, format: { with: /\A[\p{katakana}\p{blank}]+\z/, message: 'Please enter in the full-width katakana' }
   validates :birth_day,          presence: true

   validates :password, confirmation: true
  end
