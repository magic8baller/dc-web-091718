class RetailersController < ApplicationController

  def index
    @retailers = Retailer.all
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  def new
    @retailer = Retailer.new
    3.times {@retailer.snacks.build}
  end

  def create
    @retailer = Retailer.create(retailer_params)
    if @retailer.errors.any?
      # @retailer.snacks.build
      render :new
    else
      redirect_to retailer_path(@retailer)
    end
  end

  private

  def retailer_params
    params.require(:retailer).permit(:name, :year_established,
        snacks_attributes: [:name, :deliciousness, :calories])
  end
end
