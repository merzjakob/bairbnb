class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    # to be changed to show all bookings for user_id and for flat_id
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
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
      redirect_to dashboard_path

    else
      render 'flats/show'
    end
  end

  def edit
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:booking_id])
  end

  def update
    # @booking = Booking.find(params[:id])
    # @booking.update(booking_params)
    # raise
    # @flat = Flat.find(params[:id])
    # @flat.? # We'll see that in a moment.
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "Approved"
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end
end
