class CategoryCropsController < ApplicationController
  def index
    @category_crops = CategoryCrop.all
    @category = ""
    @crops = ""
  end

  def new
    @category_crop = CategoryCrop.new
  end

  def create
    if Category.exists?(name: params[:category].downcase)
      @category = Category.find_by(name: params[:category].downcase)
    else
      flash[:alert] = "Category does not exist"
      @category_crops = CategoryCrop.all
      render action: "index" and return
    end

    params[:crops].each do |crop|
      if !crop.empty?
        if Crop.exists?(name: crop.downcase)
          @crop = Crop.find_by(name: crop.downcase)
          @category_crop = CategoryCrop.new({:category => @category, :crop => @crop})
          if !@category_crop.save
            flash[:alert] = "Failure at crop " + crop + ". Previous crops have been added"
            @category_crops = CategoryCrop.all
            render action: "index" and return
          end
        else
          flash[:alert] = "Crop " + crop + " does not exist. Previous crops have been added"
          @category_crops = CategoryCrop.all
          render action: "index" and return
        end
      end
    end

    @category_crops = CategoryCrop.all
    render 'index'
  end

  def show
  end

  def edit
  end

  def update
  end
end
