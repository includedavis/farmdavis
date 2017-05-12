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
      @category = Category.new(crop_params)
      if @category.save
        CategoryCrop.create(category: @category, crop: @crop)
        flash[:success] = "Automatically created an associated category"
      else
        flash[:alert] = "Could not automatically create associated single-crop category"
      end
  		redirect_to @crop
  	else
  		render 'new'
  	end
  end

  def show
  	@crop = Crop.find(params[:id])
  end

  def destroy
    @crop = Crop.find(params[:id])
    @crop.category_crops.destroy_all
    @crop.destroy
    redirect_to crops_path
  end
end


  private

    def crop_params
  		params.require(:crop).permit(:name)
  	end
