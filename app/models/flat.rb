class Flat < ApplicationRecord
  belongs_to :user
  # has_many :pictures
  has_many :bookings, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :reviews, through: :bookings
end
