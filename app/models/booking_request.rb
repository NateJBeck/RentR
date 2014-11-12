class BookingRequest < ActiveRecord::Base
  validates :ends_on, presence: true
  validates :guest_number, presence: true
  validates :listing_id, presence: true
  validates :starts_on, presence: true
  validates :user_id, presence: true

  belongs_to :listing
  belongs_to :user

  def self.to(user)
    joins(:listing).
      where("listings.user_id = ?", user.id)
  end
end
