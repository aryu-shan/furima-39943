class Condition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :usage

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
   validates :usage_id, numericality: { other_than: 1 , message: "can't be blank"}
end
