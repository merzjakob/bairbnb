class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  # before_save :calculate_total_price

  # def calculate_total_price
  #   nights = self.end_date - self.start_date
  #   self.total_price = nights * self.flat.price_per_night
  #   self.save!
  # end

end
