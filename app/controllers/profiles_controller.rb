class ProfilesController < ApplicationController
  def dashboard
    @bookings = (current_user.bookings).order(updated_at: :desc)
    @flats = current_user.flats.order(updated_at: :desc)
    @booking_host = @bookings.joins(:flat).joins(:user).where("user_id = current_user_id")
    @host = []
    current_user.flats.each do |flat|
      flat.bookings.each do |booking|
        @host << booking
      end
    end
    # ((@bookings.flat.user_id) == (current_user_id)
    # @guests = @flats.bookings
  end
end
