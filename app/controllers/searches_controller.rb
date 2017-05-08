class SearchesController < ApplicationController
  before_action :set_search, only: [:show]
  before_action :require_user

  # new
  # ===
  #   Create a new search query
  #
  # GET /searches/new
  def new
    @search = Search.new
  end

  # show
  # ====
  #   Display the search query and results
  #
  # GET /searches/:id
  def show
  end

  # create
  # ======
  #   Create a new search query
  #
  # POST /searches/create
  def create
    @search = Search.new(searches_params)

    if @search.save
      render :show
    end
  end

private
  def searches_params
    params.require(:search).permit!
  end

  # set_search
  # ==========
  #   Set the search for the Action
  def set_search
    @search = Search.find_by_id(params[:id])
  end
end
