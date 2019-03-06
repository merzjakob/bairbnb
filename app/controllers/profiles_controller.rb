class ProfilesController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @flats = current_user.flats
    # @guests = @flats.bookings
  end
end
