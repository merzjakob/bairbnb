class Flat < ApplicationRecord
  belongs_to :user
  has_many :pictures, :bookings
  has_many :reviews, through: :bookings
end
