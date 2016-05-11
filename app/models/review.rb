class Review < ActiveRecord::Base
  belongs_to :product

  validates :review_text, presence: true
  validates :rating, presence: true
end
