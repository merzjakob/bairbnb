class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    identify_flat
  end

  def new
    @flat = Flat.new
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def identify_flat
    @flat = Flat.find(params[:id])
  end
end
