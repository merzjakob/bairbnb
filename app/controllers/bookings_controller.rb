class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    # to be changed to show all bookings for user_id and for flat_id
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    stay = (@booking.end_date - @booking.start_date).days.to_i / 86_400
    @total_price = stay * @flat.price_per_night
    @booking.total_price = @total_price
    @booking.flat = @flat
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end
end
