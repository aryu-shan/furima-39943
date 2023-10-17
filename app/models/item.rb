class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
 
  validates :name,              presence: true
  validates :explanation,       presence: true  
  validates :price,             presence: true, format: { with: /\A\d+\z/, message: "Price is invalid. Input half-width characters" },
                                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between 300 and 9,999,999" }
  validates :image,             presence: true,unless: :was_attached?

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_burden_id
    validates :area_id
    validates :handling_time_id
  end

    belongs_to:user
    has_one_attached :image

    belongs_to :category
    belongs_to :fee_burden
    belongs_to :handling_time
    belongs_to :condition
    belongs_to :area

    def was_attached?
      self.image.attached?
    end
  end

