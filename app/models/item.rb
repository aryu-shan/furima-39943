class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image

  validates :name,              presence: true  
  validates :explanation,       presence: true  
  validates :category_id,       presence: true  
  validates :condition_id,      presence: true  
  validates :price,             presence: true  
  validates :user,              presence: true
  validates :fee_burden_id,     presence: true  
  validates :area_id,           presence: true  
  validates :handling_time_id,  presence: true  
end
