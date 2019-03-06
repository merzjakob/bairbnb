class ProfilesController < ApplicationController
  def dashboard
    @bookings = (current_user.bookings).order(updated_at: :desc)
    @flats = current_user.flats.order(updated_at: :desc)
    # @guests = @flats.bookings
  end
end
