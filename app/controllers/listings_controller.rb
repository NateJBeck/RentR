class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = current_user.listings.new
    @listing.images = [Image.new, Image.new, Image.new]
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
    @listing = load_listing_from_url
    number_of_images_left = Listing::NUMBER_OF_IMAGES - @listing.images.count

    number_of_images_left.times do
      @listing.images.build
    end
  end

  def update
    @listing = load_listing_from_url

    if @listing.update(listing_params)
      redirect_to user_listings_path
    else
      render :edit
    end
  end

  def destroy
    listing = load_listing_from_url
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
        :max_guest_number,
        :starts_on,
        :ends_on,
        :description,
        images_attributes: [:id, :url, :_destroy]
    )
  end

  def load_listing_from_url
    current_user.listings.find(params[:id])
  end
end
