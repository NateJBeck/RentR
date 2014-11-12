class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = find_location_from_url
  end

  private

  def find_location_from_url
    Location.find(params[:id])
  end
end
