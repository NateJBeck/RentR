class LikesController < ApplicationController
  def index
    @listings = current_user.liked_listings
  end

  def create
    listing = load_listing_from_url
    listing.likes.create(user_id: current_user.id)
    redirect_to :back
  end

  def destroy
    listing = load_listing_from_url
    listing.likes.where(user_id: current_user.id).first.destroy
    redirect_to :back
  end

  private

  def load_listing_from_url
    Listing.find(params[:listing_id])
  end
end
