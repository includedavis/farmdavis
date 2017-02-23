class DonationsController < ApplicationController

  def show
    @donation = Donation.find(params[:id])
  end	

  def new
  	@donation = Donation.new
  end

  def create
  	@donation = Donation.new(donation_params)
  	if @donation.save
  		redirect_to @donation
  	else
  		render 'new'
  	end
  end

  private

  	def donation_params
      params.require(:donation).permit(:date, :crop, :quantity)
    end
end
