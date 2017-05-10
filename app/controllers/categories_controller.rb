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

  # update
  # ======
  #   Update an existing donation
  # PUT /donations/:id/update
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category sucessfully updated"
      redirect_to @category
    else
      flash[:warning] = "Could not save edits"
      render 'edit' #need to flash a failure message
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.category_crops.destroy_all
    @category.destroy
    redirect_to categories_path
  end

  private

    def category_params
  		params.require(:category).permit(:name)
  	end
end
