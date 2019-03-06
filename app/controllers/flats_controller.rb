class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # else
      # @flats = Flat.all
    # end
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    if params[:query][:city].present? && params[:query][:number_of_guests].present?
      @flats = @flats.where(city: params[:query][:city], number_of_guests: params[:query][:number_of_guests])
    elsif params[:query][:city].present?
       @flats = @flats.where(city: params[:query][:city])
    end


    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat }),
        # image_url: helpers.asset_url('app/assets/images/map.png')
      }
    end
  end

  def show
    identify_flat
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_images_path(@flat)
    else
      render :new
    end
  end

  def destroy
  end

  def update
  end

  private

  def identify_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :number_of_guests, :price_per_night, :city, :address)
  end
end
