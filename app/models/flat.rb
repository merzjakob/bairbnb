class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :pictures
  has_many :bookings
  has_many :reviews, through: :bookings
end
