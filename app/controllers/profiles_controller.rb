class ProfilesController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @flats = current_user.flats
  end
end
