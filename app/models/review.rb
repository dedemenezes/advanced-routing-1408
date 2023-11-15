class Review < ApplicationRecord
  validates :content, presence: true
  belongs_to :restaurant
  # if I have a review I can do review.restaurant
  # if I have a review I can do review.restaurant = an_instance_of_restaurant
end
