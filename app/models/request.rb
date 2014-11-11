class Request < ActiveRecord::Base
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :guest_number, presence: true
  validates :listing_id, presence: true
  validates :user_id, presence: true

  belongs_to :listing
  belongs_to :user
end
