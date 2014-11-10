class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def destroy
    current_user = User.find(params[:user_id])
    listing = current_user.listings.find(params[:id])
    listing.destroy
    redirect_to :back
  end

  private

  def listing_params
    params.require(:listing).permit(
        :title,
        :price,
        :location,
        :bedrooms,
        :starts_on,
        :ends_on,
        :description
    )
  end
end
