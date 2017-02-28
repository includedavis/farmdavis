class DonationsController < ApplicationController
  before_action :require_user, only: [:create, :new]
  before_action :set_donation, only: [:show]

  # index
  # =====
  #   List all donations
  #
  # GET /donations
  def index
    @donations = Donation.all
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
  	@donation = Donation.new
  end

  # create
  # ======
  #   Create a new donation
  #
  # POST /donations/create
  def create
  	@donation = Donation.new(donation_params)
  	if @donation.save
  		redirect_to @donation
  	else
  		render 'new'
  	end
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
    
    # donation_params
    # ===============
    #   Trusted paramaters
  	def donation_params
      params.require(:donation).permit(:date, :crop, :quantity)
    end
end
