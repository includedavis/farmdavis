class CropsController < ApplicationController

  def index
  	@crops = Crop.all.order(:name)
  end

  def new
  	@crop = Crop.new
  end

  def create
    @crop = Crop.new(crop_params)
    ActiveRecord::Base.transaction do
      @crop.save!
      @category = Category.new(crop_params.merge(singular: true))
      @category.save!
      CategoryCrop.create!(category: @category, crop: @crop)
      flash[:success] = "Automatically created an associated category"
      redirect_to @crop
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:errors] = e.message
    render 'new'
  end

  def show
  	@crop = Crop.find(params[:id])
  end

  def destroy
    @crop = Crop.find(params[:id])
    @category = Category.where(name: @crop.name)
      .where(singular: true)
      .destroy_all
    @crop.category_crops.destroy_all
    @crop.destroy
    redirect_to crops_path
  end
end


  private

    def crop_params
  		params.require(:crop).permit(:name)
  	end
