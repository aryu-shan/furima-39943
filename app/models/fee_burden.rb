class Fee_Burden < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage

   validates :title, :text, presence: true
   validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
end
