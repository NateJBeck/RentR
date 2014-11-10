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

  def edit
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
