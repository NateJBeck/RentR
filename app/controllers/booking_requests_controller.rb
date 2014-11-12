class BookingRequestsController < ApplicationController
  def index
    @booking_requests_from_me = current_user.booking_requests
    @booking_requests_to_me = BookingRequest.to(current_user)
  end

  def new
    @listing = load_listing_from_url
    @booking_request = current_user.booking_requests.new
  end

  def create
    @listing = load_listing_from_url
    @booking_request = current_user.booking_requests.new(booking_request_params)

    if @booking_request.save
      redirect_to booking_requests_path
    else
      render :new
    end
  end

  def show
    @listing = load_listing_from_url
    @booking_request = load_booking_request_from_url
  end

  def edit
    @listing = load_listing_from_url
    @booking_request = load_booking_request_from_url
  end

  def update
    @listing = load_listing_from_url
    @booking_request = load_booking_request_from_url

    if @booking_request.update(booking_request_params)
      redirect_to [@listing, @booking_request]
    else
      render :edit
    end
  end

  def destroy
    booking_request = load_booking_request_from_url
    booking_request.destroy
    redirect_to booking_requests_path
  end

  private

  def load_listing_from_url
    Listing.find(params[:listing_id])
  end

  def load_booking_request_from_url
    BookingRequest.find(params[:id])
  end

  def booking_request_params
    listing = load_listing_from_url
    params.
      require(:booking_request).
      permit(:starts_on, :ends_on, :guest_number, :user_id).
      merge(listing_id: listing.id)
  end
end
