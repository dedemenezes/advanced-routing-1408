class Restaurant < ApplicationRecord
  validates :name, presence: true
  has_many :reviews
  # if I have a restaurant I can do restaurant.reviews
end
