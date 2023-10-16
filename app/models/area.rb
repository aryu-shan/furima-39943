class Area < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :title, :text, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end
