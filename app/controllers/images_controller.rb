class ImagesController < ApplicationController
  def index
    @flat = Flat.find(params[:flat_id])
    @images = @flat.images.where.not(photo: nil)
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @flat = Flat.find(params[:flat_id])
    @image.flat = @flat
    if @image.save
      redirect_to flat_images_path(params[:flat_id])
    else
      @images = @flat.images.where.not(photo: nil)
      flash[:alert] = "Please add an image"
      render :index
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to flat_images_path(params[:flat_id])
  end

  private

  def image_params
    params.require(:image).permit(:photo)
  end
end
