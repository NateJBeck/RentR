class LikesController < ApplicationController
  def create
    listing = load_listing_from_url
    listing.likes.create(user_id: current_user.id)
    redirect_to listings_path
  end

  def destroy
    listing = load_listing_from_url
    listing.likes.where(user_id: current_user.id).first.destroy
    redirect_to listings_path
  end

  private

  def load_listing_from_url
    Listing.find(params[:listing_id])
  end
end