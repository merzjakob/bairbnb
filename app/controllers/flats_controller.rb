class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.where(city: params[:query])
    else
      @flats = Flat.all
    end
  end

  def show
    identify_flat
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@cocktail)
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
