class DonationsController < ApplicationController
  before_action :require_user, only: [:create, :new, :edit, :update]
  before_action :set_donation, only: [:show, :edit, :destroy]

  # index
  # =====
  #   List all donations
  #
  # GET /donations
  def index
    @search = Search.new  # Used for querying db

    @donations = Donation.all.order("date DESC").paginate(:page => params[:page])
  end

  # show
  # ====
  #   Show a specific donation
  #
  # GET /donations/:id
  def show
  end

  # new
  # ===
  #   Create new donation
  #
  # GET /donations/new
  def new
  	@donations = Array.new(10) {Donation.new}
  end

  # create
  # ======
  #   Create a new donation
  #
  # POST /donations/create
  def create
    @donations = donation_params
    @donations.each do |donation|
    	@donation = Donation.new(subdonation_params donation)
      @donation.save
    end
    redirect_to action: "index"
  end

  # edit
  # ====
  #   Edit an existing donation
  #
  # GET /donations/:id/edit
  def edit
    @donation = Donation.find(params[:id])
  end


  # update
  # ======
  #   Update an existing donation
  # PUT /donations/:id/update
  def update
    @donation = Donation.find(params[:id])
    if @donation.update_attributes(full_donation_params)
      redirect_to @donation
    else
      render 'edit' #need to flash a failure message
    end
  end

  # destroy
  # =======
  #   Delete an existing donation
  # DELETE /donations/:id
  def destroy
    @donation.destroy
    redirect_to donations_path
  end

  private
    # set_donation
    # ============
    #   Set the donation for Action
    # Edge Case:
    #   Donation does not exist - Redirect to root
    def set_donation
      @donation = Donation.find_by_id(params[:id]) # Does not error if donation DNE
      redirect_to root_path unless @donation
    end

    def full_donation_params
      params.require(:donation).permit(:date, :crop, :quantity,
                                   :harvested_from, :donated_to, :comments)
    end

    # donation_params
    # ===============
    # Required parameters
    def donation_params
      params.require(:donations)
    end



    # subdonation_params
    # ===============
    #   Trusted paramaters
    def subdonation_params(subparams)
      subparams.permit(:date, :crop, :quantity,
        :donated_to, :harvested_from, :comments)
    end
end
