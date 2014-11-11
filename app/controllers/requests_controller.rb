class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @listing = load_listing_from_url
    @request = current_user.requests.new
  end

  def create
    @listing = load_listing_from_url
    @request = current_user.requests.new(request_params)
    if @request.save
      redirect_to @listing
    else
      render :new
    end
  end

  private

  def load_listing_from_url
    Listing.find(params[:listing_id])
  end

  def request_params
    listing = load_listing_from_url
    params.
      require(:request).
      permit(:starts_on, :ends_on, :guest_number, :user_id).
      merge(listing_id: listing.id)
  end
end
