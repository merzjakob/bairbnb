class Flat < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :bookings
  has_many :reviews, through: :bookings
end
