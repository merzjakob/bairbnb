class Booking < ApplicationRecord
  # before_create :check_date_order
  belongs_to :user
  belongs_to :flat
  has_many :reviews
  # before_save :calculate_total_price

  # def calculate_total_price
  #   nights = self.end_date - self.start_date
  #   self.total_price = nights * self.flat.price_per_night
  #   self.save!
  # end
  # def check_date_order
  #   self.end_date > self.start_date
  # end


  validate :end_date_after_start_date

private

  def end_date_after_start_date
      # binding.pry
    if self.end_date < self.start_date
      # puts 'jelo'
        errors.add(:end_date, "must be after the start date")
      # errors.add(:end_date, "must be after the start date")
    end
  end
end
