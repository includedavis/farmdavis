class CropsController < ApplicationController

  def index
  	@crops = Crop.all
  end

  def new
  	@crop = Crop.new
  end

  def create
  	@crop = Crop.new(crop_params)
  	if @crop.save
  		redirect_to @crop
  	else
  		render 'new'
  	end
  end

  def show
  	@crop = Crop.find(params[:id])
  end
end


  private

    def crop_params
  		params.require(:crop).permit(:name)
  	end
