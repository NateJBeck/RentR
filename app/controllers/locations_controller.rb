class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = find_location_from_url
    @listings = Listing.where(location: "#{ @location.id }")
  end

  private

  def find_location_from_url
    Location.find(params[:id])
  end
end
