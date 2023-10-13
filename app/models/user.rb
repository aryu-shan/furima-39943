class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname,           presence: true         
   validates :password,           presence: true, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: "Please include both letters and numbers" }
   validates :family_name,        presence: true
   validates :first_name,         presence: true
   validates :family_name_kana,   presence: true, format:{ with: /\A[\p{katakana}\p{blank}]+\z/, message: 'Please enter in the full-width katakana' }
   validates :first_name_kana,    presence: true, format: { with: /\A[\p{katakana}\p{blank}]+\z/, message: 'Please enter in the full-width katakana' }
   validates :birth_day,          presence: true
  end
