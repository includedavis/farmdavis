class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to @category
  	else
  		render 'new'
  	end
  end

  def show
  	@category = Category.find(params[:id])
  end

  # edit
  # ====
  #   Edit an existing donation
  #
  # GET /donations/:id/edit
  def edit
    @category = Category.find(params[:id])
  end

  private

    def category_params
  		params.require(:category).permit(:name)
  	end
end
