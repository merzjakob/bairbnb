class AddFlatRefToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :flat, foreign_key: true
  end
end
