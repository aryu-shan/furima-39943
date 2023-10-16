class Handling_Time < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :schedule

  validates :title, :text, presence: true
  validates :schedule_id, numericality: { other_than: 1 , message: "can't be blank"}
end
